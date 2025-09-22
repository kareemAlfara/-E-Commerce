
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/ProfileDetailsScreen.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/myorders.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/profilePayments.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/whoAre.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svg_flutter/svg.dart';

class homeprofileScreen extends StatefulWidget {
  const homeprofileScreen({
    super.key,
  });

  @override
  State<homeprofileScreen> createState() => _homeprofileScreenState();
}

class _homeprofileScreenState extends State<homeprofileScreen> {
   String? username;
  String? userId;
  String ? email;

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
                      backgroundColor: Colors.grey[200],
                      child: Padding(padding: const EdgeInsets.all(5.0)),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 20,
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
                  username??"kareem"  ,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      email??"kareem@yha.com",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            defulttext(data: "عام ", fw: FontWeight.w700),
    
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
            profiledefultContainer(title: " المدفوعات ", image: Assets.wallet,
            onPressed: () {
               Navigator.of(context).pushNamed(ProfilePayments.routeName);
            },),
            SizedBox(height: 6),
            profiledefultContainer(title: " المفضلة ", image: Assets.heart),
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
              icon: Row(children: [
                Text("العربية"),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 22,
                ),
                SizedBox(width: 6),
              ],),
              onPressed: () {},
            ),
            SizedBox(height: 6),
            profiledefultContainer(title: " الوضع", image: Assets.imagesEdit,  icon: Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: true,
                  onChanged: (value) {
                    // cubit.changesaveAddress(value);
                  },
                ),
              ),),
              SizedBox(height: 6),
              defulttext(data: "المساعدة", fw: FontWeight.w700),
              SizedBox(height: 6),
    
              profiledefultContainer(title: "من نحن ", image: Assets.info,
              onPressed: () {
                 Navigator.of(context).pushNamed(Whoare.routeName);
              },),
              Padding(
                padding: const EdgeInsets.only(top:  8.0,right: 8,left: 8),
                child: CustomButton(onPressed: (){}, text: "تسجيل خروج",),
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
        defulttext(data: title, fw: FontWeight.w700),
        Spacer(),
        IconButton(onPressed: onPressed, icon: icon,color: Colors.grey,),
      ],
    );
  }
}
