import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

class GoodsProvider with ChangeNotifier {
  int carouselIndex = 0;
  CarouselController carouselController = CarouselController();

  changeIndexCarousel(int index) {
    this.carouselIndex = index;

    notifyListeners();
  }
}
