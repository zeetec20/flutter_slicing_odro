import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordo/models/Goods.dart';
import 'package:ordo/models/Review.dart';
import 'package:ordo/provider/goods_provider.dart';
import 'package:ordo/service/utils.dart';
import 'package:provider/provider.dart';

class GoodsPage extends StatelessWidget {
  final Goods goods;
  GoodsPage(this.goods);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
        create: (_) => GoodsProvider(),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: Color(0xffFCF8F8),
            body: SafeArea(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: size.width * 0.05,
                        right: size.width * 0.05,
                        top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                height: 0.07 * size.width,
                                width: 0.07 * size.width,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff64A1F4)),
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: ImageIcon(
                                      AssetImage('assets/icon/back.png'),
                                      color: Colors.white,
                                      size: 15,
                                    )),
                              ),
                              Text(
                                'Produk Detail',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff64A1F4),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.01 * size.width,
                              right: 0.01 * size.width),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          width: 0.09 * size.width,
                          height: 0.09 * size.width,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage('assets/icon/shop.png'),
                              color: Color(0xff64A1F4),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 0.01 * size.width,
                              right: 0.01 * size.width),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          width: 0.09 * size.width,
                          height: 0.09 * size.width,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage('assets/icon/notification2.png'),
                              color: Color(0xffFF485A),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Consumer<GoodsProvider>(
                        builder: (context, goodsProvider, child) {
                      return CarouselSlider(
                        carouselController: goodsProvider.carouselController,
                        options: CarouselOptions(
                          onPageChanged: (index, reason) =>
                              goodsProvider.changeIndexCarousel(index),
                          height: size.height * 0.29,
                          viewportFraction: 1,
                        ),
                        items: [
                          goods.imageTransparant,
                          goods.imageTransparant,
                          goods.imageTransparant
                        ].map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(
                                    left: size.width * 0.15,
                                    right: size.width * 0.15),
                                decoration: BoxDecoration(
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
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        width: size.width * 0.3,
                        child: Row(
                          children: [
                            Consumer<GoodsProvider>(
                                builder: (context, goodsProvider, child) {
                              return Expanded(
                                flex: goodsProvider.carouselIndex == 0 ? 2 : 3,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  margin:
                                      EdgeInsets.only(left: 2.5, right: 2.5),
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: goodsProvider.carouselIndex == 0
                                          ? Color(0xff64A1F4)
                                          : Color(0xff3C7DD9),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              );
                            }),
                            Consumer<GoodsProvider>(
                                builder: (context, goodsProvider, child) {
                              return Expanded(
                                flex: goodsProvider.carouselIndex == 1 ? 2 : 3,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  margin:
                                      EdgeInsets.only(left: 2.5, right: 2.5),
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: goodsProvider.carouselIndex == 1
                                          ? Color(0xff64A1F4)
                                          : Color(0xff3C7DD9),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              );
                            }),
                            Consumer<GoodsProvider>(
                                builder: (context, goodsProvider, child) {
                              return Expanded(
                                flex: goodsProvider.carouselIndex == 2 ? 2 : 3,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  margin:
                                      EdgeInsets.only(left: 2.5, right: 2.5),
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: goodsProvider.carouselIndex == 2
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
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 70,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(70)),
                            color: Color(0xffFF485A)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(60)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 30,
                                  left: size.width * 0.05,
                                  right: size.width * 0.05),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    goods.name,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff47623F),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 3, bottom: 3),
                                    decoration: BoxDecoration(
                                        color: Color(0xffDFAE1D),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      'Barang Bekas',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 3, bottom: 3),
                                    decoration: BoxDecoration(
                                        color: Color(0xff64A1F4),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      'Stock 100',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 5,
                                  left: size.width * 0.05,
                                  right: size.width * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Utils.intToIDR(goods.priceDiscount),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff64A1F4)),
                                        ),
                                      ),
                                      Text(
                                        Utils.intToIDR(goods.price),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Color(0xff64A1F4)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color: Color(0xff3C7DD9),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      'Diskon ${goods.discountString}',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 1,
                              width: size.width * 0.9,
                              color: Colors.black.withOpacity(0.1),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20,
                                  left: size.width * 0.05,
                                  right: size.width * 0.05),
                              alignment: Alignment.centerLeft,
                              child: Text('Vendor',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xff47623F),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500))),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10,
                                  left: size.width * 0.05,
                                  right: size.width * 0.05),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 47,
                                        width: 47,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  goods.shop.profile),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Text(
                                        goods.shop.name,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.5),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        size: 25,
                                        color: Color(0xff64A1F4),
                                      ),
                                      Text(
                                        '${goods.totalRate} | ${goods.calculateCountReview} Terjual',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.5,
                                            color: Color(0xff3C7DD9),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20,
                                  left: size.width * 0.05,
                                  right: size.width * 0.05),
                              alignment: Alignment.centerLeft,
                              child: Text('Deskripsi',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xff47623F),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500))),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10,
                                  left: size.width * 0.05,
                                  right: size.width * 0.05),
                              alignment: Alignment.centerLeft,
                              child: Text(goods.description,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xff47623F),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500))),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20,
                                  left: size.width * 0.05,
                                  right: size.width * 0.05),
                              alignment: Alignment.centerLeft,
                              child: Text('Ulasan dan penilaian',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xff47623F),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500))),
                            ),
                            SizedBox(
                              height: 15 ,
                            ),
                            ...goods.review
                                .map((review) => reviewWidget(context, review))
                                .toList(),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

Widget reviewWidget(context, Review review) {
  Size size = MediaQuery.of(context).size;

  return Container(
    margin: EdgeInsets.only(
        left: size.width * 0.05, right: size.width * 0.05, bottom: 20),
    padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 179, 179, 179).withOpacity(0.3),
            blurRadius: 5,
          )
        ]),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(review.user.profile),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        review.user.name,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      child: Text(
                        '14 Mmin',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 11,
                            color: Color(0xffB4BBC6),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  size: 25,
                  color: Color(0xffFA4A0C),
                ),
                Container(
                  child: Text(
                    review.rate.toString(),
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            review.review,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 12),
            ),
          ),
        )
      ],
    ),
  );
}
