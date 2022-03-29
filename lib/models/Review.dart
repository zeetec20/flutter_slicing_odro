import 'User.dart';

class Review {
  final User user;
  final String review;
  final double rate;

  Review(this.user, this.rate, this.review);
}
