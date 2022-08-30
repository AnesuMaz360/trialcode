import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  String id;
  String bottleName;
  String image;
  double price;
  int quantity;
  Cart({
    required this.id,
    required this.bottleName,
    required this.image,
    required this.price,
    required this.quantity,
  });
}
