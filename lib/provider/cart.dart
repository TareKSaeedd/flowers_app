import 'package:flutter/material.dart';
import 'package:flowers_app/model/items.dart';

class Cart with ChangeNotifier {
  List selectedProducts = [];
  double priceProduct = 0;

  add(Items prodcut) {
    selectedProducts.add(prodcut);
    priceProduct += prodcut.itemPrice.round();
    notifyListeners();
  }

  remove(Items product) {
    selectedProducts.remove(product);
    priceProduct -= product.itemPrice.round();
    notifyListeners();
  }
}
