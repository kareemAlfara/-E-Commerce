import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/presentation/productcubit/product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/FavoriteGridView.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favoritepage extends StatefulWidget {
  const Favoritepage({super.key});
  static const String routeName = 'Favoritepage';
  @override
  State<Favoritepage> createState() => _FavoritepageState();
}

class _FavoritepageState extends State<Favoritepage> {
  String? userId;
  String? username;
  String? email;
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

Future<void> _loadUserData() async {
  final prefs = await SharedPreferences.getInstance();
  final loadedId = prefs.getString('user_id');
  setState(() {
    userId = loadedId;
    username = prefs.getString('username');
    email = prefs.getString('email');
  });

  if (loadedId != null && mounted) {
    context.read<ProductCubit>().loadFavorites(loadedId); // 🔹 preload
  }
}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: 'المفضلة'),
      body: userId == null
        ? const Center(child: CircularProgressIndicator()) // show loading until userId ready
        : FavoriteGridView(userId: userId!),
    );
  }
}
