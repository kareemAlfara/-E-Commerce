import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits_hub/features/home/presentation/Cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/mainviewbody.dart';

class Mainviewbolcconsumer extends StatefulWidget {
  const Mainviewbolcconsumer({super.key});

  @override
  State<Mainviewbolcconsumer> createState() => _MainviewbolcconsumerState();
}

class _MainviewbolcconsumerState extends State<Mainviewbolcconsumer> {
    int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is addedcartsuccess) {
            Fluttertoast.showToast(
              msg: "تم اضافة المنتج بنجاح",
              backgroundColor: Colors.green,
            );
          } else if (state is addedcartfailure) {
            Fluttertoast.showToast(
              msg: state.error,
              backgroundColor: Colors.red,
            );
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: CustomBottomNavigationBar(
              onItemTapped: (index) {
                currentViewIndex = index;

                setState(() {});
              },
            ),
            body: mainviewbody(currentViewIndex: currentViewIndex),
          );
        },
      ),
    );
  }
}
