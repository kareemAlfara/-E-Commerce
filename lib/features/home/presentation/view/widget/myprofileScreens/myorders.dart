import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/OrderTracking.dart'
    show orderContainer;
import 'package:svg_flutter/svg.dart';

class Myorders extends StatefulWidget {
  const Myorders({super.key});
  static const String routeName = 'myorders';

  @override
  State<Myorders> createState() => _MyordersState();
}

class _MyordersState extends State<Myorders> {
  bool istraking = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'طلباتي',
        isShowActions: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.grey[100],
                    child: myorderContainer(
                      image: Assets.imagefullbox,
                      istraking: istraking,
                      onPressed: () {
                        istraking = !istraking;
                        setState(() {
                          
                        });
                      },
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
              istraking  ?  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildStep("تتبع الطلب", true),
                        _buildStep("قبول الطلب", true),
                        _buildStep("تم شحن الطلب", true),
                        _buildStep("خرج للتوصيل", false),
                        _buildStep("قيد الانتظار", false),
                        _buildStep("تم التسليم", true),
                      ],
                    ),
                  ): Container(),
                ],
              ),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class myorderContainer extends StatelessWidget {
  const myorderContainer({
    super.key,
    required this.image,
    required this.children,
    this.color = const Color(0xffEBF9F1),
    required this.istraking, this.onPressed,
  });
  final bool istraking;
  final String image;
  final List<Widget> children;
  final Color color;
  final void Function()? onPressed;
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
          Spacer(),

          IconButton(
            onPressed: onPressed,
            icon: istraking?Icon(Icons.keyboard_arrow_up, size: 33,color: Colors.green,)  :Icon(Icons.keyboard_arrow_down, size: 33),
          ),
        ],
      ),
    );
  }
}

Widget _buildStep(String title, bool isCompleted) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 14,
              color: isCompleted ? Colors.black : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Icon(
          Icons.circle,
          size: 14,
          color: isCompleted ? Colors.green : Colors.grey.shade400,
        ),
      ],
    ),
  );
}
