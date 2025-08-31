import 'package:fruits_hub/features/auth/data/models/usersModel.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signin_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepository {
  @override
  Future<UserEntity> signin(String email, String password) async {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final user = response.user!;
    return Usersmodel(
      id: user.id,
      email: user.email!,
      password: "",
      name: user.userMetadata?['full_name'] ?? '',
    );
  }

  final GoogleSignIn googleSignIn = GoogleSignIn(
    serverClientId:
        '1038966682534-317bseg5av19o0rr9utljotbrlbmg6nj.apps.googleusercontent.com',
    scopes: ['email', 'profile'],
  );

  @override
  Future<UserEntity> signinWithGoogle() async {
    await googleSignIn.signOut();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) throw Exception('Google sign-in cancelled');

    final googleAuth = await googleUser.authentication;
    if (googleAuth.idToken == null) throw Exception('No ID Token from Google');
    final AuthResponse response = await Supabase.instance.client.auth
        .signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: googleAuth.idToken!,
          accessToken: googleAuth.accessToken,
        );

    final user = response.user!;
    await Supabase.instance.client.from('users').upsert({
      "user_id": user.id,
      "name": user.userMetadata?['full_name'] ?? googleUser.displayName,
      "email": user.email,
      "password": 'google_oauth',
    });

    return Usersmodel(
      password: 'google_oauth',
      id: user.id,
      name: user.userMetadata?['full_name'] ?? googleUser.displayName ?? '',
      email: user.email!,
    );
  }

  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<void> signout() async {
    await Future.wait([googleSignIn.signOut(), _supabase.auth.signOut()]);
  }
  
  @override
  Future<UserEntity> signup(String email, String password, String name)async {
    final response = await Supabase.instance.client.auth.signUp(
          email: email,
          password: password,
        );
    await    Supabase.instance.client.from('users').insert({
      "user_id":  response.user!.id,
          'name':name,
          'email': email,
          'password': password,
        });
        return Usersmodel(
          id: response.user!.id,
          email: email,
          password: password,
          name: name,
        );
  }
  
}
