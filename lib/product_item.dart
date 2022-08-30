import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:trialcode/homeScreen.dart';
import 'package:trialcode/product_provider.dart';
import 'package:trialcode/shopping_cart_provider.dart';

class ProductItem extends StatelessWidget {
  HomePage homeInstance = const HomePage();
  String id;
  String bottleName;
  String imgUrl;
  double price;
  bool isFavourite;
  ProductItem(
      {Key? key,
      required this.id,
      required this.bottleName,
      required this.imgUrl,
      required this.price,
      this.isFavourite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<ShoppingCartProvider>(context);
    var product = Provider.of<ProductProvider>(context);
    return Card(
      shadowColor: Colors.grey,
      surfaceTintColor: Colors.amber,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 10,
              child: InkWell(
                onTap: () {
                  product.isFavoritePressed(id, bottleName, imgUrl, price);
                  if (product.isFavourite) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Product Added to Favorite!",
                          style: TextStyle(fontSize: 16),
                        ),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Product Removed from Favorite!",
                          style: TextStyle(fontSize: 16),
                        ),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                child: Icon(
                  product.isFavourite ? Icons.favorite : Icons.favorite_border,
                  size: 25,
                  color: Colors.redAccent,
                ),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  imgUrl,
                  height: 200.0,
                ),
              ),
              Center(
                  child: Text(bottleName,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold))),
              Center(
                child: Text('R$price'),
              )
            ],
          ),
          Positioned(
              bottom: 0,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.add_circle),
                iconSize: 40.0,
                onPressed: () {
                  cart.addToCart(id, bottleName, price, imgUrl);
                },
              ))
        ],
      ),
    );
  }
}
