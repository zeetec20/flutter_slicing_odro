import 'dart:math';

import 'package:ordo/models/Cart.dart';
import 'package:ordo/models/Goods.dart';
import 'package:ordo/models/Review.dart';
import 'package:ordo/models/Shop.dart';
import 'package:ordo/models/User.dart';

class DB {
  List<Map> listGoods = [
    {
      'id': 7871963553,
      'shop': 932837232,
      'image': 'assets/images/goods/goods1.png',
      'imageTransparant': 'assets/images/goods/goods_transparant1.png',
      'name': 'Lorem Ipsun',
      'discount': 0.1,
      'sold': 200,
      'price': 6000,
      'review': 230,
      'description':
          'Deskripsi In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
    },
    {
      'id': 2817328997,
      'shop': 932837232,
      'image': 'assets/images/goods/goods2.png',
      'imageTransparant': 'assets/images/goods/goods_transparant2.png',
      'name': 'Lorem Ipsun',
      'discount': 0.1,
      'sold': 200,
      'price': 6000,
      'review': 630,
      'description':
          'Deskripsi In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
    },
    {
      'id': 656885586,
      'shop': 932837232,
      'image': 'assets/images/goods/goods3.png',
      'imageTransparant': 'assets/images/goods/goods_transparant3.png',
      'name': 'Lorem Ipsun',
      'discount': 0.1,
      'sold': 200,
      'price': 6000,
      'review': 230,
      'description':
          'Deskripsi In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
    },
    {
      'id': 1268402901,
      'shop': 932837232,
      'image': 'assets/images/goods/goods4.png',
      'imageTransparant': 'assets/images/goods/goods_transparant4.png',
      'name': 'Lorem Ipsun',
      'discount': 0.1,
      'sold': 200,
      'price': 6000,
      'review': 230,
      'description':
          'Deskripsi In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
    },
    {
      'id': 1316833576,
      'shop': 932837232,
      'image': 'assets/images/goods/goods5.png',
      'imageTransparant': 'assets/images/goods/goods_transparant5.png',
      'name': 'Lorem Ipsun',
      'discount': 0.1,
      'sold': 200,
      'price': 6000,
      'review': 30,
      'description':
          'Deskripsi In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
    },
    {
      'id': 2748110628,
      'shop': 932837232,
      'image': 'assets/images/goods/goods6.png',
      'imageTransparant': 'assets/images/goods/goods_transparant6.png',
      'name': 'Lorem Ipsun',
      'discount': 0.1,
      'sold': 200,
      'price': 6000,
      'review': 130,
      'description':
          'Deskripsi In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
    },
    {
      'id': 3361901278,
      'shop': 932837232,
      'image': 'assets/images/goods/goods7.png',
      'imageTransparant': 'assets/images/goods/goods_transparant7.png',
      'name': 'Lorem Ipsun',
      'discount': 0.1,
      'sold': 200,
      'price': 6000,
      'review': 230,
      'description':
          'Deskripsi In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
    },
    {
      'id': 8428079819,
      'shop': 932837232,
      'image': 'assets/images/goods/goods8.png',
      'imageTransparant': 'assets/images/goods/goods_transparant8.png',
      'name': 'Lorem Ipsun',
      'discount': 0.1,
      'sold': 200,
      'price': 6000,
      'review': 530,
      'description':
          'Deskripsi In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.'
    }
  ];

  List<Map> listShop = [
    {
      'id': 932837232,
      'profile': 'assets/images/shop/shop.png',
      'name': 'Eiger Store'
    }
  ];

  List<Map> listUser = [
    {'profile': 'assets/images/users/user1.png', 'name': 'Maude Hall'},
    {'profile': 'assets/images/users/user2.png', 'name': 'Ester Howard'}
  ];

  List<Map> listCart = [
    {'id': 7868190357, 'goods': 3361901278, 'quantity': 1, 'note': null},
    {'id': 147724524, 'goods': 1316833576, 'quantity': 4, 'note': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore'},
    {'id': 562991821, 'goods': 7871963553, 'quantity': 10, 'note': null}
  ];

  List<Goods> getGoods() => this.listGoods.map((e) {
        Shop shop = this
            .listShop
            .where((shop) => shop['id'] == e['shop'])
            .map((e) => Shop(e['id'], e['profile'], e['name']))
            .toList()
            .first;
        Map userData = listUser[Random().nextInt(listUser.length)];
        User user = User(userData['profile'], userData['name']);
        return Goods(
            e['id'],
            shop,
            e['image'],
            e['imageTransparant'],
            e['name'],
            e['description'],
            e['discount'],
            e['sold'],
            e['price'],
            List<Review>.generate(
                e['review'],
                (index) => Review(
                    user,
                    (3 + Random().nextInt(5 - 3)).toDouble(),
                    "That's a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback.")));
      }).toList();

  List<Cart> getCart() => this.listCart.map((cart) {
        Goods goods = this
            .getGoods()
            .where((goods) => goods.id == cart['goods'])
            .toList()
            .first;
        return Cart(cart['id'], cart['quantity'], goods, cart['note']);
      }).toList();
}
