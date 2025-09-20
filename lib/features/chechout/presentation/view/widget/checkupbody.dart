
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/chechout/presentation/Checkupcubit/checkup_cubit.dart';
import 'package:fruits_hub/features/chechout/presentation/view/shippingView.dart';
import 'package:fruits_hub/features/home/domain/entites/allCartEntity.dart';

class checkupBody extends StatelessWidget {
  const checkupBody({
    super.key, required this.cartitem,
  });
final allcartEntity cartitem;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckupCubit()..getcartitem(cartitem),
      child: BlocConsumer<CheckupCubit, CheckupState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.read<CheckupCubit>();
          return Scaffold(
            appBar: cubit.defaultChechupAppBar(
              context: context,
              title: cubit.appbartitle[state.index],
              isShowActions: false,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Appcycle(title: " الشحن", index: 1, isexist: true),
                      Appcycle(
                        title: "العنوان",
                        index: 2,
                        isexist: state.index >= 1 ? true : false,
                      ),
                      Appcycle(
                        title: "الدفع",
                        index: 3,
                        isexist: state.index >= 2 ? true : false,
                      ),
                      Appcycle(
                        title: "المراجعة",
                        index: 4,
                        isexist: state.index >= 3 ? true : false,
                      ),
                    ],
                  ),
                  Expanded(child: cubit.checkupbody[state.index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
