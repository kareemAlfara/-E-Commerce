import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:fruits_hub/features/home/domain/entites/reviewEntity.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/addreview.dart';
import 'package:intl/intl.dart';
import 'package:svg_flutter/svg.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key, required this.product});
  final Productsentities product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: defaultAppBar(
        context: context,
        title: 'المراجعة',
        isShowActions: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: product.reviews.isNotEmpty ? Column(
          children: [
            // App Icon and Title
            const SizedBox(height: 8),
            AddCommentView(product_id: product.id),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // const SizedBox(height: 30),

                // Rating Section
                defulttext(
                  context: context,
                  data: 'التقييم',
                  fSize: 17,
                  fw: FontWeight.bold,
                ),
                defulttext(
                  context: context,
                  data: '${product.reviews.length} مراجعة',
                  color: Colors.grey,
                  fSize: 16,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Rating Bars
            Column(
              children: [
                _buildRatingBar(
                  5,
                  product.reviews
                          .where(
                            (review) =>
                                review.ratingcount == 5 ||
                                review.ratingcount > 5,
                          )
                          .length /
                      product.reviews.length,
                ),
                const SizedBox(height: 8),
                _buildRatingBar(
                  4,
                  product.reviews
                          .where((review) => review.ratingcount == 4)
                          .length /
                      product.reviews.length,
                ),
                const SizedBox(height: 8),
                _buildRatingBar(
                  3,
                  product.reviews
                          .where((review) => review.ratingcount == 3)
                          .length /
                      product.reviews.length,
                ),
                const SizedBox(height: 8),
                _buildRatingBar(
                  2,
                  product.reviews
                          .where((review) => review.ratingcount == 2)
                          .length /
                      product.reviews.length,
                ),
                const SizedBox(height: 8),
                _buildRatingBar(
                  1,
                  product.reviews
                          .where((review) => review.ratingcount == 1)
                          .length /
                      product.reviews.length,
                ),
              ],
            ),

            const SizedBox(height: 20),
    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${product.avgRating.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
            // Overall Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (product.avgRating / 5) * 100 > 75 ? 'ممتاز بناءً' : 'جيد بناءً',
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                
                    Text(
                      '${((product.avgRating / 5) * 100).toStringAsFixed(2)} % ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        // color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),
            ListView.separated(
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.grey,
                margin: EdgeInsets.symmetric(vertical: 11, horizontal: 22),
              ),
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: product.reviews.length,
              itemBuilder: (context, index) {
                // final review = product.reviews[index];
                return _buildReviewItem(product.reviews[index]);
              },
            ),
          ],
        ):Center(
          child: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: defulttext(
              context: context,
              data: "لا توجد مراجعات لهذا المنتج",
              fSize: 18,
              fw: FontWeight.bold,
            ),
          ),
              ),
        ),
      ),
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Row(
      children: [
        Text('$stars', style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewItem(final Reviewentity review) {
    DateTime dateTime = DateTime.parse(review.createdAt);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    review.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // color: Colors.black,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(dateTime),
                    style: const TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                review.descriptionmessage,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  height: 1.4,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AddCommentView extends StatelessWidget {
  const AddCommentView({super.key, required this.product_id});
  final int product_id;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black12.withOpacity(0.6)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: () {
          navigat(context, widget: reviewView(product_id: product_id));
        },
        child: Row(
          children: [
            SvgPicture.asset(Assets.user, fit: BoxFit.scaleDown),
            const SizedBox(width: 8),
            Expanded(
              child: defulttext(
                context: context,

                data: " اضافة تعليق...",
                color: Colors.grey,
                fSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
