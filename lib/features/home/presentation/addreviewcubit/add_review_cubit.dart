import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/home/domain/usecases/addreviewsusecase.dart';
import 'package:meta/meta.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  final addreviewsusecase addreviewsusecas;
  var formkey = GlobalKey<FormState>();
  UserEntity? userEntity;
  var descriptioncontroller = TextEditingController();
  var ratingcontroller = TextEditingController();
  AddReviewCubit(this.addreviewsusecas) : super(AddReviewInitial());
  addreview({
    required String descriptionmessage,
    required String name,
    required int product_id,
    required String user_id,
    required num ratingcount,
  }) async {
    try {
      final addreview = await addreviewsusecas(
        descriptionmessage: descriptionmessage,
        name: name,
        product_id: product_id,
        user_id: user_id,
        ratingcount: ratingcount,
      );
    
      emit(AddReviewsuccess());
    } on Exception catch (e) {
      // TODO
      emit(AddReviewfailur(error: e.toString()));
    }
  }
}
