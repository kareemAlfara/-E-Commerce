import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/theme_notifier.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/usecases/Google_Signin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/facebookSignin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signin_user.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signout.dart';
import 'package:fruits_hub/features/auth/presentation/SigninCubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/view/signinView.dart';
import 'package:fruits_hub/features/home/presentation/Cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/productcubit/product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/ProfileDetailsScreen.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/favoritepage.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/myorders.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/profilePayments.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/whoAre.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svg_flutter/svg.dart';

class homeprofileScreen extends StatefulWidget {
  const homeprofileScreen({super.key, required this.themeNotifier});
  final ThemeNotifier themeNotifier;

  @override
  State<homeprofileScreen> createState() => _homeprofileScreenState();
}

class _homeprofileScreenState extends State<homeprofileScreen> {
  String? username;
  String? userId;
  String? email;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id');
      username = prefs.getString('username');
      email = prefs.getString('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "حسابي",
        isShowActions: false,
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 33,
                        backgroundImage: AssetImage(Assets.imagesProfileImage),
                      // backgroundColor: Colors.grey[200],
                      child: Padding(padding: const EdgeInsets.all(5.0)),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      username ?? "kareem",
                      style: TextStyle(
                      
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      email ?? "kareem@yha.com",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            defulttext(context: context, data: "عام ", fw: FontWeight.w700),

            SizedBox(height: 10),
            profiledefultContainer(
              title: "المعلومات الشخصية",
              image: Assets.user,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ProfileDetailsScreen.routeName,
                  arguments: {
                    "username": username ?? "kareem",
                    "email": email ?? "kareem@yha.com",
                  },
                );
              },
            ),
            SizedBox(height: 6),
            profiledefultContainer(
              title: " طلباتي",
              image: Assets.imagefullbox,
              onPressed: () {
                Navigator.of(context).pushNamed(Myorders.routeName);
              },
            ),
            SizedBox(height: 6),
            profiledefultContainer(
              title: " المدفوعات ",
              image: Assets.wallet,
              onPressed: () {
                Navigator.of(context).pushNamed(ProfilePayments.routeName);
              },
            ),
            SizedBox(height: 6),
            profiledefultContainer(
              title: " المفضلة ",
              image: Assets.heart,
              onPressed: () {
                Navigator.of(context).pushNamed(Favoritepage.routeName);
              },
            ),
            SizedBox(height: 6),
            profiledefultContainer(
              title: " الإشعارات",
              image: Assets.imagesNotification,
              icon: Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: true,
                  onChanged: (value) {
                    // cubit.changesaveAddress(value);
                  },
                ),
              ),
            ),
            SizedBox(height: 6),
            profiledefultContainer(
              title: " اللغة ",
              image: Assets.global,
              icon: Row(
                children: [
                  Text("العربية"),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                    size: 22,
                  ),
                  SizedBox(width: 6),
                ],
              ),
              onPressed: () {},
            ),
            SizedBox(height: 6),
            profiledefultContainer(
              title: " الوضع",
              image: Assets.imagesEdit,
              icon: Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: widget.themeNotifier.isDark,
                  onChanged: (value) {
                    widget.themeNotifier.toggleTheme();
                  },
                ),
              ),
            ),
            SizedBox(height: 6),
            defulttext(context: context, data: "المساعدة", fw: FontWeight.w700),
            SizedBox(height: 6),

            profiledefultContainer(
              title: "من نحن ",
              image: Assets.info,
              onPressed: () {
                Navigator.of(context).pushNamed(Whoare.routeName);
              },
            ),

            // Replace your logout button code with this:
            BlocProvider(
              create: (context) => SigninCubit(
                SigninUser(AuthRepoImpl()),
                SigninWithGoogle(AuthRepoImpl()),
                Signout(AuthRepoImpl()),
                FacebookSignin(AuthRepoImpl()),
              ),
              child: BlocBuilder<SigninCubit, Signinstate>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                    child: CustomButton(
                      onPressed: () async {
                        // Sign out user
                        await context.read<SigninCubit>().signOut();
                        // Clear cart data
                        Navigator.pop(context);
                        if (context.mounted) {
                          context
                              .read<CartCubit>()
                              .allcartEntiy
                              .cartlist
                              .clear();
                        }
                        // Add a small delay to ensure cleanup is complete
                        await Future.delayed(const Duration(milliseconds: 100));
                        // Check if widget is still mounted before navigation

                        if (context.mounted) {
                          // Method 1: Using pushAndRemoveUntil with MaterialPageRoute
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => Signinview(
                                themeNotifier: widget.themeNotifier,
                              ),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      text: "تسجيل خروج",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class profiledefultContainer extends StatelessWidget {
  const profiledefultContainer({
    super.key,
    required this.title,
    required this.image,
    this.onPressed,
    this.icon = const Icon(Icons.arrow_forward_ios_outlined, size: 22),
  });
  final String title;
  final String image;
  final Widget icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(child: SvgPicture.asset(image, width: 20, height: 20)),
        SizedBox(width: 6),
        defulttext(context: context, data: title, fw: FontWeight.w700),
        Spacer(),
        IconButton(onPressed: onPressed, icon: icon, color: Colors.grey),
      ],
    );
  }
}
