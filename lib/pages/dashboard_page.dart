import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordo/models/Goods.dart';
import 'package:ordo/pages/checkout_page.dart';
import 'package:ordo/pages/goods_page.dart';
import 'package:ordo/provider/app_provider.dart';
import 'package:ordo/service/db.dart';
import 'package:ordo/service/utils.dart';
import 'package:provider/provider.dart';

class DahsboardPage extends StatelessWidget {
  final DB db = new DB();

  @override
  Widget build(BuildContext context) {
    List<List<Goods>> listGoodsWidget = [];
    List<String> carousels = [
      'assets/images/carousel.png',
      'assets/images/carousel.png',
      'assets/images/carousel.png'
    ];
    db.getGoods().asMap().entries.forEach((goods) {
      if ((goods.key + 1) % 2 == 0)
        return listGoodsWidget[listGoodsWidget.length - 1].add(goods.value);
      return listGoodsWidget.add([goods.value]);
    });

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffFCF8F8),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.05, right: size.width * 0.05, top: 15),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(right: 0.01 * size.width),
                    alignment: Alignment.center,
                    height: 0.09 * size.width,
                    decoration: BoxDecoration(
                        color: Color(0xffF0F0F0),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50)),
                    child: TextField(
                      style: TextStyle(height: 1, fontSize: 15),
                      decoration: InputDecoration(
                          hintText: 'Cari dengan mengetik barang',
                          hintStyle: TextStyle(height: 1, fontSize: 15),
                          border: InputBorder.none,
                          prefixIcon: Container(
                            padding: EdgeInsets.all(8),
                            child: ImageIcon(
                              AssetImage('assets/icon/search.png'),
                              color: Color(0xff526430),
                            ),
                          )),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(
                        left: 0.01 * size.width, right: 0.01 * size.width),
                    decoration: BoxDecoration(
                        color: Color(0xff64A1F4),
                        borderRadius: BorderRadius.circular(8)),
                    width: 0.09 * size.width,
                    height: 0.09 * size.width,
                    child: IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage('assets/icon/setting.png'),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 0.01 * size.width, right: 0.01 * size.width),
                    decoration: BoxDecoration(
                        color: Color(0xffDFAE1D),
                        borderRadius: BorderRadius.circular(8)),
                    width: 0.09 * size.width,
                    height: 0.09 * size.width,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => CheckoutPage()));
                      },
                      icon: ImageIcon(
                        AssetImage('assets/icon/shop.png'),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 0.01 * size.width, right: 0.01 * size.width),
                    decoration: BoxDecoration(
                        color: Color(0xffFF485A),
                        borderRadius: BorderRadius.circular(8)),
                    width: 0.09 * size.width,
                    height: 0.09 * size.width,
                    child: IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage('assets/icon/notification.png'),
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Consumer<AppProvider>(
                  builder: (context, appProvider, child) {
                    return CarouselSlider(
                      carouselController: appProvider.carouselController,
                      options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            appProvider.changeIndexCarousel(index),
                        height: size.height * 0.17,
                        viewportFraction: 1,
                      ),
                      items: carousels.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                  left: size.width * 0.05,
                                  right: size.width * 0.05),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8),
                  width: size.width * 0.3,
                  child: Row(
                    children: [
                      Consumer<AppProvider>(
                          builder: (context, appProvider, child) {
                        return Expanded(
                          flex: appProvider.carouselIndex == 0 ? 2 : 3,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            height: 8,
                            decoration: BoxDecoration(
                                color: appProvider.carouselIndex == 0
                                    ? Color(0xff64A1F4)
                                    : Color(0xff3C7DD9),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        );
                      }),
                      Consumer<AppProvider>(
                          builder: (context, appProvider, child) {
                        return Expanded(
                          flex: appProvider.carouselIndex == 1 ? 2 : 3,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            height: 8,
                            decoration: BoxDecoration(
                                color: appProvider.carouselIndex == 1
                                    ? Color(0xff64A1F4)
                                    : Color(0xff3C7DD9),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        );
                      }),
                      Consumer<AppProvider>(
                          builder: (context, appProvider, child) {
                        return Expanded(
                          flex: appProvider.carouselIndex == 2 ? 2 : 3,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            height: 8,
                            decoration: BoxDecoration(
                                color: appProvider.carouselIndex == 2
                                    ? Color(0xff64A1F4)
                                    : Color(0xff3C7DD9),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.width * 0.05,
            ),
            ...listGoodsWidget.map((rowGoodsWidget) {
              return Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    bottom: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: rowGoodsWidget
                      .map((goods) => goodsWidget(context, goods))
                      .toList(),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}

Widget goodsWidget(context, Goods goods) {
  Size size = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => GoodsPage(goods)));
    },
    child: Container(
      width: size.width * 0.425,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(goods.image), fit: BoxFit.cover)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(7.5),
                        bottomRight: Radius.circular(7.5)),
                    color: Color(0xffDFAE1D),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 179, 179, 179)
                              .withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 5))
                    ]),
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Icon(
                        Icons.star_rounded,
                        color: Colors.white,
                        size: 13,
                      ),
                      margin: EdgeInsets.only(bottom: 2),
                    ),
                    Text(
                      '${goods.totalRate} | ${goods.calculateCountReview} rating',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 11)),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8, left: 10),
                    child: Text(
                      Utils.intToIDR(goods.price),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 13,
                        color: Color(0xff3C7DD9),
                        decoration: TextDecoration.lineThrough,
                      )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      Utils.intToIDR(goods.priceDiscount),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xff3C7DD9),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 10),
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                    color: Color(0xff3C7DD9),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Diskon ${goods.discountString}',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 10),
            child: Text(
              goods.name,
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    ),
  );
}
