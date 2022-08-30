class Bottle {
  String id;
  String bottleName;
  String image;
  String bottletype;
  int time;
  double price;
  Bottle(
      {required this.id,
      required this.bottleName,
      required this.image,
      required this.bottletype,
      required this.time,
      required this.price});
}

class BottleCategory {
  int categoryNo;
  String bottleType;
  List<Bottle> bottleList;
  BottleCategory(
      {required this.categoryNo,
      required this.bottleType,
      required this.bottleList});
}
