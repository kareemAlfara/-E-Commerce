import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/addnewCard.dart';
import 'package:svg_flutter/svg.dart';

class ProfilePayments extends StatelessWidget {
  const ProfilePayments({super.key});
  static const routeName = 'profilePayments';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "المدفوعات ",
        isShowActions: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 17),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color:Theme.of(context).brightness == Brightness.dark ?Colors.black12.withOpacity(0.4): Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                defulttext(
                          context: context,

                  data: "    1111  **** **** **** ",
                  fSize: 16,
                  fw: FontWeight.w700,
                  color: Colors.grey,
                ),
                SizedBox(width: 11),
                Container(
                  padding: EdgeInsets.all(11),

                  decoration: BoxDecoration(
                    // color: Color(0xff1434CB),
                    border: Border.all(  color: Colors.white,),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: SvgPicture.asset(
                    Assets.imagevisa,
                    color: Color(0xff1434CB,),
                    width: 40,
                    height: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color:Theme.of(context).brightness == Brightness.dark ?Colors.black12.withOpacity(0.4): Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                defulttext(
                  context: context,
                  data: "    3322  **** **** **** ",
                  fSize: 16,
                  fw: FontWeight.w700,
                  color: Colors.grey,
                ),
                SizedBox(width: 11),
                Container(
                  
                  padding: EdgeInsets.all(11),
            
                  decoration: BoxDecoration(
                    
                    // color: Color(0xff1434CB),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: SvgPicture.asset(
                    Assets.image_instapay,
                    width: 40,
                    height: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CustomButton(onPressed: () {
                 Navigator.of(context).pushNamed(Addnewcard.routeName);
            }, text: " +  إضافة بطاقة جديدة ",
                fSize: 17,),
          )
        ],
      ),
    );
  }
}
