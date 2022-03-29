import 'package:ordo/models/Goods.dart';

class Cart {
  final int id, quantity;
  final Goods goods;
  final String? note;

  Cart(this.id, this.quantity, this.goods, this.note);
}
