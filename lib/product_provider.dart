import 'package:flutter/cupertino.dart';
import 'package:trialcode/product.dart';
import 'package:trialcode/product_item.dart';

class ProductProvider with ChangeNotifier {
  bool isFavourite = false;
  List<BottleCategory> get bottleItems {
    return [...bottleItems];
  }

  List<Bottle> get bottleObjects {
    return [...bottleObjects];
  }

  final List<ProductItem> _favItems = [];

  List<ProductItem> get favItem {
    return [..._favItems];
  }

  get bottle => null;

  void isFavoritePressed(
      String id, String bottleName, String image, double price) {
    isFavourite = !isFavourite;
    _favItems.insert(
        0,
        ProductItem(
            id: id, bottleName: bottleName, imgUrl: image, price: price));
    notifyListeners();
  }
}
