import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {
  int navbar = 0;
  int carouselIndex = 0;
  CarouselController carouselController = CarouselController();

  changeIndexCarousel(int index) async {
    this.carouselIndex = index;

    notifyListeners();
  }

  changePage(int index, Function changePage) {
    this.navbar = index;
    changePage();

    notifyListeners();
  }
}
