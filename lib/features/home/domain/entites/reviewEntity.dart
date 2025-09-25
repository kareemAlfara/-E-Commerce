class Reviewentity {
  final String descriptionmessage;
  final String name;
  final int product_id;
  final String user_id;
  final num ratingcount;
  final String createdAt;

  Reviewentity({
    required this.descriptionmessage,
    required this.createdAt,
    required this.name,
    required this.product_id,
    required this.user_id,
    required this.ratingcount,
  });
}
