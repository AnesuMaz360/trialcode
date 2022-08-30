import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trialcode/circle_indicator.dart';
import 'package:trialcode/product.dart';
import 'package:trialcode/product_item.dart';
import 'package:trialcode/product_provider.dart';
import 'package:trialcode/search_widget.dart';
import 'package:trialcode/shopping_cart_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ProductProvider productProvider = ProductProvider();
  late TabController tabController;
  late Bottle bottleProvider;

  final List<BottleCategory> categories = [
    BottleCategory(categoryNo: 1, bottleType: 'Brandy', bottleList: [
      Bottle(
          id: 'KLPB',
          bottleName: 'Klipdrift Brandy',
          image: 'lib/assets/images/KlipdriftBrandy.png',
          time: 20,
          price: 274.00,
          bottletype: 'Brandy'),
      Bottle(
          id: 'KWV3',
          bottleName: 'Kwv Brandy 3 years',
          image: 'lib/assets/images/KwvBrandy3years.jpg',
          time: 20,
          price: 274.00,
          bottletype: 'Brandy'),
    ]),
    BottleCategory(categoryNo: 2, bottleType: 'Gin', bottleList: [
      Bottle(
          id: 'BMBS',
          bottleName: 'Bombay Sapphire Gin',
          image: 'lib/assets/images/BombaySapphireGin.png',
          time: 20,
          price: 274.00,
          bottletype: 'Gin'),
      Bottle(
          id: 'TNGN',
          bottleName: 'Tanqueray Gin',
          image: 'lib/assets/images/TanquerayGin.png',
          time: 20,
          price: 274.00,
          bottletype: 'Gin'),
    ]),
    BottleCategory(categoryNo: 3, bottleType: 'Soft Drinks', bottleList: [
      Bottle(
          id: 'COCA',
          bottleName: 'Coca Cola',
          image: 'lib/assets/images/CocaCola.jpg',
          time: 20,
          price: 274.00,
          bottletype: 'Soft Drinks'),
      Bottle(
          id: 'SPRT',
          bottleName: 'Sprite',
          image: 'lib/assets/images/Sprite.jpg',
          time: 20,
          price: 274.00,
          bottletype: 'Soft Drinks'),
    ]),
    BottleCategory(categoryNo: 4, bottleType: 'Whiskey', bottleList: [
      Bottle(
          id: '',
          bottleName: 'Jameson',
          image: 'lib/assets/images/Jameson.jpg',
          time: 20,
          price: 274.00,
          bottletype: 'Whiskey'),
      Bottle(
          id: '',
          bottleName: 'Johnnie Walker Black Label',
          image: 'lib/assets/images/JohnnieWalkerBlackLabel.jpg',
          time: 20,
          price: 274.00,
          bottletype: 'Whiskey'),
    ]),
  ];

  List<Bottle> getBottleItem() {
    List<Bottle> localBottles = [];
    for (var x = 0; x < categories.length; x++) {
      var currentElement = categories[x].bottleList;
      for (var y = 0; y < currentElement.length; y++) {
        var bottleElement = currentElement[y];
        localBottles.add(bottleElement);
      }
    }
    print(localBottles);
    return localBottles;
  }

  late List<Bottle> allBottles = getBottleItem();
  late List<Bottle> bottles;
  String query = " ";

  void searchBottle(String query) {
    final bottles = allBottles.where((bottle) {
      final bottleNameLower = bottle.bottleName.toLowerCase();
      final searchLower = query.toLowerCase();

      return bottleNameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.bottles = bottles;
      this.query = query;
    });
  }

  Widget buildSearch() {
    return SearchWidget(
      text: query,
      hintText: 'Search for beverages',
      onChanged: searchBottle,
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<ShoppingCartProvider>(context);
    Size _screenSize = MediaQuery.of(context).size;
    final double itemHeight = (_screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = _screenSize.width / 2;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearch(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Categories',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Montserrat-ExtraBold',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: tabController,
                  indicator:
                      CircleTabIndicator(color: Colors.redAccent, radius: 4.0),
                  isScrollable: true,
                  labelColor: Colors.redAccent,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  tabs: const [
                    Tab(text: 'Brandy'),
                    Tab(text: 'Gin'),
                    Tab(text: 'Soft drinks'),
                    Tab(text: 'Whiskey')
                  ],
                ),
              ),
            ),
            Container(
              height: 400,
              width: double.maxFinite,
              child: TabBarView(
                  controller: tabController,
                  children: categories.map((bottleCategory) {
                    return GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: itemWidth / itemHeight,
                        children: bottleCategory.bottleList.map((bottle) {
                          return ProductItem(
                            id: bottle.id,
                            bottleName: bottle.bottleName,
                            imgUrl: bottle.image,
                            price: bottle.price,
                          );
                        }).toList());
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
