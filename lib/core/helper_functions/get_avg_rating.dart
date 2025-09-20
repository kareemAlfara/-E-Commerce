

import 'package:fruits_hub/features/home/data/models/reviewModel.dart';

num getAvgRating(List<Reviewmodel> reviews) {
   if (reviews.isEmpty) return 0.0; //
  var sum = 0.0;
  for (var review in reviews) {
    sum += review.ratingcount;
  }
  return sum / reviews.length;
}
