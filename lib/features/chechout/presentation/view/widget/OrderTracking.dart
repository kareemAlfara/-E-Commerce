import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:svg_flutter/svg.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "تتبع الطلب",
        isShowActions: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.grey[100],
                child: orderContainer(
                  image: Assets.imagefullbox,
                  children: [
                    defulttext(
                      data: "رقم الطلب : 123456",
                      fw: FontWeight.bold,
                      color: Colors.black,
                    ),
                    defulttext(
                      data: "تم الطلب 22 اكتوبر 2022",
                      fw: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        defulttext(
                          data: "عدد الطلبات :   ",
                          fw: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        defulttext(
                          data: "2",
                          fw: FontWeight.bold,
                          color: Colors.black,
                        ),
                        SizedBox(width: 15),
                        defulttext(
                          data: "150 جنيه",
                          fw: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.grey[100],
                padding: EdgeInsets.all(27),
                child: Column(
                  children: [
                    orderContainer(
                      image: Assets.imagempty_box,
                      children: [
                        defulttext(
                          data: "تتبع الطلب",
                          fw: FontWeight.bold,
                          color: Colors.black,
                        ),
                        defulttext(
                          data: " 22 اكتوبر 2022",
                          fw: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    orderContainer(
                      image: Assets.imagempty_box,
                      children: [
                        defulttext(
                          data: "تتبع الطلب",
                          fw: FontWeight.bold,
                          color: Colors.black,
                        ),
                        defulttext(
                          data: " 22 اكتوبر 2022",
                          fw: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    orderContainer(
                      image: Assets.checked,
                      children: [
                        defulttext(
                          data: "قبول  الطلب",
                          fw: FontWeight.bold,
                          color: Colors.black,
                        ),
                        defulttext(
                          data: " 22 اكتوبر 2022",
                          fw: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
        
                    orderContainer(
                      image: Assets.location2,
                      children: [
                        defulttext(
                          data: "تم شحن  الطلب",
                          fw: FontWeight.bold,
                          color: Colors.black,
                        ),
                        defulttext(
                          data: " 22 اكتوبر 2022",
                          fw: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    orderContainer(
                      color: Colors.white10,
        
                      image: Assets.tranck,
                      children: [
                        defulttext(
                          data: "   خرج للتوصيل",
                          fw: FontWeight.bold,
                          color: Colors.black,
                        ),
                        defulttext(
                          data: " قيد الانتظار  ",
                          fw: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    orderContainer(
                      color: Colors.white10,
                      image: Assets.bike,
                      children: [
                        defulttext(
                          data: "تم الاستلام ",
                          fw: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class orderContainer extends StatelessWidget {
const  orderContainer({
    super.key,
    required this.image,
    required this.children,
    this.color =const Color(0xffEBF9F1),
  });
  final String image;
  final List<Widget> children;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 33,
                backgroundColor: color,
                child: SvgPicture.asset(image),
              ),
            ],
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
      
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ],
      ),
    );
  }
}
