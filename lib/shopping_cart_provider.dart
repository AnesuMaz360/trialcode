import 'package:flutter/cupertino.dart';
import 'package:trialcode/cart.dart';

class ShoppingCartProvider with ChangeNotifier {
  final Map<String, Cart> _cartItems = {};

  Map<String, Cart> get cartItem {
    return {..._cartItems};
  }

  void removeBottle(String id) {
    _cartItems.remove(id);
    notifyListeners();
  }

  void addToCart(
      String id, String bottleName, double bottlePrice, String image) {
    if (_cartItems.containsKey(id)) {
      _cartItems.update(id, (existingItem) {
        return Cart(
            id: existingItem.id,
            bottleName: existingItem.bottleName,
            image: existingItem.image,
            price: existingItem.price,
            quantity: existingItem.quantity + 1);
      });
    } else {
      _cartItems.putIfAbsent(id, () {
        return Cart(
            id: id,
            bottleName: bottleName,
            image: image,
            price: bottlePrice,
            quantity: 1);
      });
    }
    notifyListeners();
  }

  void addQuantity(String id) {
    _cartItems.update(id, (existingItem) {
      return Cart(
          id: existingItem.id,
          bottleName: existingItem.bottleName,
          image: existingItem.image,
          price: existingItem.price,
          quantity: existingItem.quantity + 1);
    });
    notifyListeners();
  }

  void reduceQuantity(String id) {
    _cartItems.update(id, (existingItem) {
      if (existingItem.quantity == 1) {
        return Cart(
            id: existingItem.id,
            bottleName: existingItem.bottleName,
            image: existingItem.image,
            price: existingItem.price,
            quantity: existingItem.quantity);
      } else {
        return Cart(
            id: existingItem.id,
            bottleName: existingItem.bottleName,
            image: existingItem.image,
            price: existingItem.price,
            quantity: existingItem.quantity - 1);
      }
    });
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, eachItem) {
      total = total + eachItem.price * eachItem.quantity;
    });
    return total;
  }

  int get cartCount {
    return _cartItems.length;
  }
}
