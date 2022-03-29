import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordo/models/Cart.dart';
import 'package:ordo/models/Goods.dart';
import 'package:ordo/models/Shop.dart';
import 'package:ordo/service/db.dart';
import 'package:ordo/service/utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CheckoutPage extends StatelessWidget {
  final DB db = DB();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    int calculatePriceCheckout() =>
        this
            .db
            .getCart()
            .map((e) => e.goods.priceDiscount * e.quantity)
            .reduce((a, b) => a + b) +
        10000;

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
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 0.07 * size.width,
                        width: 0.07 * size.width,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff64A1F4)),
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
                        'Checkout',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xff64A1F4),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ...db.getCart().map((e) => goodsWidget(context, e)),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
            margin: EdgeInsets.only(
                top: 30, left: size.width * 0.05, right: size.width * 0.05),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 179, 179, 179).withOpacity(0.3),
                    blurRadius: 5,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Catatan Pesanan',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Color(0xffCDCDCD),
                    ),
                  ),
                  child: TextField(
                    maxLines: 5,
                    minLines: 4,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Color(0xffCDCDCD)),
                        hintText: 'Ketik disisni...',
                        border: InputBorder.none),
                    style: TextStyle(color: Color(0xff8A7F7F)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 20, left: size.width * 0.05, right: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Pembayaran',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 7,
                ),
                ...db.getCart().map((cart) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              cart.goods.name,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ),
                            Text(
                              '(Qty. ${cart.quantity})',
                              style: GoogleFonts.poppins(
                                  textStyle: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                        Text(
                          Utils.intToIDR(
                              cart.goods.priceDiscount * cart.quantity),
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000))),
                        )
                      ],
                    ),
                  );
                }).toList(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ongkos Kirim',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      Utils.intToIDR(10000),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000))),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 1,
                  width: size.width * 0.9,
                  color: Colors.black.withOpacity(0.1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub Total',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      Utils.intToIDR(calculatePriceCheckout()),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Color(0xff3C7DD9),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Waktu Pengantaran',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 20,
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Color(0xff3C7DD9),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Alamat Pengiriman',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 20,
                        )
                      ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 179, 179, 179)
                              .withOpacity(0.3),
                          blurRadius: 5,
                        )
                      ]),
                  child: Text(
                    'Tolong pastikan semua pesanan anda sudah benar dan tidak kurang.',
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 35, bottom: 40),
                    padding: EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff3C7DD9)),
                    child: Text(
                      'Bayar Sekarang',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

Widget goodsWidget(context, Cart cart) {
  Size size = MediaQuery.of(context).size;

  return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xff64A1F4), shape: BoxShape.circle),
                child: ImageIcon(
                  AssetImage('assets/icon/trash.png'),
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                height: 75,
              )
            ],
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25, bottom: 20, left: 15, right: 15),
            margin: EdgeInsets.only(
                top: 20, left: size.width * 0.05, right: size.width * 0.05),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 179, 179, 179).withOpacity(0.3),
                    blurRadius: 5,
                  )
                ]),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 179, 179, 179).withOpacity(0.3),
                        blurRadius: 5,
                      )
                    ],
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(cart.goods.imageTransparant),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              cart.goods.name,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 3, bottom: 3, left: 7, right: 7),
                            decoration: BoxDecoration(
                                color: cart.quantity < 2
                                    ? Color(0xff64A1F4)
                                    : Color(0xff3C7DD9),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_rounded,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    cart.quantity.toString(),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.add_rounded,
                                  size: 18,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              Utils.intToIDR(cart.goods.priceDiscount),
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xff64A1F4),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(
                                top: 3, bottom: 3, left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: cart.note != null
                                    ? Color(0xff64A1F4)
                                    : Color(0xff3C7DD9),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    'Catatan',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
            margin: EdgeInsets.only(
                top: 10, left: size.width * 0.05, right: size.width * 0.05),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 179, 179, 179).withOpacity(0.3),
                    blurRadius: 5,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Catatan Item',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Color(0xffCDCDCD),
                    ),
                  ),
                  child: TextField(
                    controller: TextEditingController(text: cart.note),
                    maxLines: 3,
                    minLines: 2,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Color(0xffCDCDCD)),
                        hintText: 'Ketik disisni...',
                        border: InputBorder.none),
                    style: TextStyle(color: Color(0xff8A7F7F)),
                  ),
                )
              ],
            ),
          )
        ],
      ));
}
