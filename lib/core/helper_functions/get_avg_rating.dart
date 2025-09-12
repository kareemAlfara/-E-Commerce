

import 'package:fruits_hub/features/home/data/models/reviewModel.dart';

num getAvgRating(List<Reviewmodel> reviews) {
  var sum = 0.0;
  for (var review in reviews) {
    sum += review.ratingcount;
  }
  return sum / reviews.length;
}
