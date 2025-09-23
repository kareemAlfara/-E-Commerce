import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/data/repo_impl/Product_repo_impl.dart';
import 'package:fruits_hub/features/home/domain/usecases/addreviewsusecase.dart';
import 'package:fruits_hub/features/home/presentation/addreviewcubit/add_review_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class reviewView extends StatelessWidget {
  const reviewView({super.key, required this.product_id});

  final int product_id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddReviewCubit, AddReviewState>(
      listener: (context, state) {
        var cubit = context.read<AddReviewCubit>();

        if (state is AddReviewsuccess) {
          cubit.descriptioncontroller.clear();
          cubit.ratingcontroller.clear();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Review Added')));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<AddReviewCubit>();
        return Scaffold(
          appBar: AppBar(title: Text('Add Review')),
          body: Form(
            key: cubit.formkey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  defulitTextFormField(
                    controller: cubit.ratingcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please inter the product ratingcount";
                      }
                      return null;
                    },

                    title: " rating",
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 8),
                  defulitTextFormField(
                    controller: cubit.descriptioncontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please inter the product description message";
                      }
                      return null;
                    },

                    title: " description message",
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 28),
                  // Switch(
                  //   value: cubit.isfavorite,
                  //   onChanged: (value) {
                  //     cubit.isfavoritechange(value);
                  //     log(value.toString());
                  //     ;
                  //   },
                  // ),
                  SizedBox(height: 28),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        final userId = prefs.getString('user_id');
                        final username = prefs.getString('username');
                        log(username.toString());
                        if (cubit.formkey.currentState!.validate()) {

                          cubit.addreview(
                            descriptionmessage:
                                cubit.descriptioncontroller.text,
                            name: username!,
                            product_id: product_id,
                            // product_id,
                            user_id: userId!,

                            //  "e4075906-b6f3-495b-b612-5efc34c808b6",
                            ratingcount:
                                num.tryParse(cubit.ratingcontroller.text) ?? 0,
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: defulttext(data: "  Add product  ", fSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
