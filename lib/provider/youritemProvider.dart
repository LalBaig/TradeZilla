import 'package:flutter/cupertino.dart';
import 'package:trade_zilla/Models/userproduct.dart';

import '../Models/grid_view_item_class.dart';
import '../database/database.dart';

class Youritem extends ChangeNotifier {
  List _ProductList = [];

  List get productsItems {
    return [..._ProductList];
  }

  GridProductItem getProduct(int id) {
    return _ProductList.firstWhere((product) => product.id == id,
        orElse: () => null);
  }

  Future addProduct(int id, String productname, String exchange_with,
      String address, String imagePath, String description) async {
    final product = Userproduct(
        id, imagePath, address, description, exchange_with, productname);

    notifyListeners();

    DatabaseHelper.insert({
      'id': product.id,
      'productname': product.productname,
      'imagepath': product.imagePath,
      'description': product.description,
      'address': product.address,
    });
  }

  Future getAllProducts() async {
    final productList = await DatabaseHelper.getProductFromdb();

    _ProductList = productList
        .map((product) => Userproduct(
            product['id'],
            product['productname'],
            product['exchange_with'],
            product['imagepath'],
            product['description'],
            product['address']))
        .toList();

    notifyListeners();
  }
}
