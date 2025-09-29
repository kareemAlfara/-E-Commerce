import 'dart:async';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/auth/data/models/usersModel.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/view/widget/notif.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepository {
  @override 
  Future<UserEntity> signin(String email, String password) async {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final user = response.user!;
    if (response.user != null) {
      uid = response.user!.id;
      // CRITICAL FIX: Save user_id to SharedPreferences
      // Example: notify admin when a new user logs in
  const adminId = "296f41b0-c14c-44ab-b3c5-292c86d6dea0"; 
      await notifyUser(adminId, "New login", "${user.email} just signed in!");
    }
    final supabase = Supabase.instance.client;
    final userRow = await supabase
        .from('users')
        .select('name')
        .eq('user_id', user.id)
        .maybeSingle();

    final String userName = userRow?['name'].toString() ?? "username";
    final model = Usersmodel(
      id: user.id,
      email: user.email!,
      password: "",
      name: userName,
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', uid!);
    if (uid == model.id) {}
    await prefs.setString('username', model.name);
    await prefs.setString('email', model.email);
    print("User ID saved to SharedPreferences: $uid");

    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    final fcmToken = await fcm.getToken();
    // final fcm = FirebaseMessaging.instance;
    // await fcm.requestPermission();
    // final token = await fcm.getToken();

  if (fcmToken != null) {
  await Supabase.instance.client.from('device_tokens').upsert(
    {
      'user_id': uid,
      'token': fcmToken,
    },
    // onConflict: 'token',
  );
}

    // if (token != null) {
    //   await Supabase.instance.client.from('device_tokens').upsert({
    //     'user_id': Supabase.instance.client.auth.currentUser!.id,
    //     'token': token,
    //   });
    // }
    log(model.name);
    log(model.email);
    log(model.id);
    return model.toEntity();
  }

  Future<void> notifyUser(String receiverId, String title, String body) async {
    final res = await Supabase.instance.client
        .from('device_tokens')
        .select('token')
        .eq('user_id', receiverId)
        .maybeSingle();

    final fcmToken = res?['token'] as String?;
    if (fcmToken != null) {
      // await sendNotification(
      //   receiverId: receiverId,
      //   deviceToken: fcmToken,
      //   title: title,
      //   body: body,
      // );
    } else {
      print("No token found for user $receiverId");
    }
  }

  @override
  Future<UserEntity> signup(String email, String password, String name) async {
    final response = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );
    await Supabase.instance.client.from('users').insert({
      "user_id": response.user!.id,
      'name': name,
      'email': email,
      'password': password,
    });
    if (response.user != null) {
      uid = response.user!.id;
      // CRITICAL FIX: Save user_id to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', uid!);
      await prefs.setString('username', name);
      await prefs.setString('email', email);
      print("User ID saved to SharedPreferences: $uid");
    }
    return Usersmodel(
      id: response.user!.id,
      email: email,
      password: password,
      name: name,
    ).toEntity();
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

    if (response.user != null) {
      uid = response.user!.id;
      // CRITICAL FIX: Save user_id to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', uid!);
      await prefs.setString(
        'username',
        user.userMetadata?['full_name'] ?? googleUser.displayName,
      );
      await prefs.setString('email', user.email!);

      print("User ID saved to SharedPreferences: $uid");
        const adminId = "296f41b0-c14c-44ab-b3c5-292c86d6dea0"; 
      await notifyUser(adminId, "New login", "${user.email} just signed in!");
    }
    
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    final fcmToken = await fcm.getToken();
    
  if (fcmToken != null) {
  await Supabase.instance.client.from('device_tokens').upsert(
    {
      'user_id': uid,
      'token': fcmToken,
    },
    // onConflict: 'user_id',
  );
}
    final existingUser = await Supabase.instance.client
        .from('users')
        .select('user_id')
        .eq('user_id', user.id)
        .maybeSingle();

    if (existingUser == null) {
      await Supabase.instance.client.from('users').upsert({
        "user_id": user.id,
        "name": user.userMetadata?['full_name'] ?? googleUser.displayName,
        "email": user.email,
        "password": 'google_oauth',
      });
    }

    Usersmodel model = Usersmodel(
      id: user.id,
      email: user.email!,
      password: 'google_oauth',
      name: user.userMetadata?['full_name'] ?? googleUser.displayName ?? '',
    );
    log(model.name);
    log(model.email);
    log(model.id);
    return model.toEntity();
  }

  final SupabaseClient _supabase = Supabase.instance.client;
  StreamSubscription<List<Map<String, dynamic>>>? _usersSubscription;

  @override
  Future<void> signout() async {
    await Future.wait([googleSignIn.signOut(), _supabase.auth.signOut()]);
    await _usersSubscription?.cancel();
    _usersSubscription = null;
    final pref = await SharedPreferences.getInstance();
    await pref.remove("user_id");
    await pref.remove("username");
    log('User signed out and preferences cleared');
    await Supabase.instance.client.auth.signOut();
    uid = null;
  }

  // Alternative simpler approach if the above doesn't work
  @override
  Future<UserEntity> signinWithFacebook() async {
    await signout();
    final supa = Supabase.instance.client;

    try {
      await supa.auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: 'io.supabase.flutter://login-callback',
      );

      // Wait and check for session multiple times
      for (int i = 0; i < 30; i++) {
        await Future.delayed(Duration(milliseconds: 500));

        final session = supa.auth.currentSession;
        if (session != null && session.user != null) {
          final user = session.user;
          final userEntity = Usersmodel(
            id: user.id,
            email: user.email ?? '',
            password: 'facebook_oauth',
            name:
                user.userMetadata?['full_name'] ??
                user.userMetadata?['name'] ??
                user.email?.split('@')[0] ??
                'Facebook User',
          );
          uid = user.id;
          // CRITICAL FIX: Save user_id to SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_id', uid!);

          print("User ID saved to SharedPreferences: $uid");
          await prefs.setString('username', userEntity.name);
          print("Username saved to SharedPreferences: ${userEntity.name}");
          await prefs.setString('email', userEntity.email);
          // Save to database
          await supa.from('users').upsert({
            "user_id": user.id,
            'name': userEntity.name,
            'email': userEntity.email,
            'password': userEntity.password,
          });

          return userEntity.toEntity();
        }
      }

      throw Exception('Authentication completed but no session found');
    } catch (e) {
      print('Facebook sign-in error: $e');
      throw Exception('Facebook sign-in failed: $e');
    }
  }
}
