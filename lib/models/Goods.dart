import 'package:ordo/models/Shop.dart';

import 'Review.dart';

class Goods {
  final String name, image, description, imageTransparant;
  final double discount;
  final int id, price, sold;
  final List<Review> review;
  final Shop shop;
  String get discountString => '${(this.discount * 100).toInt().toString()}%';
  int get priceDiscount => this.price - (this.price * this.discount).toInt();
  double get totalRate => double.parse((this
              .review
              .map((review) => review.rate)
              .toList()
              .reduce((a, b) => a + b) /
          this.review.length)
      .toStringAsFixed(1));
  String get calculateCountReview => (review.length.toString().length < 3)
      ? review.length.toString()
      : '${review.length.toString().split('').first}${'0' * (review.length.toString().length - 1)}+';

  Goods(this.id, this.shop, this.image, this.imageTransparant, this.name,
      this.description, this.discount, this.sold, this.price, this.review);
}
