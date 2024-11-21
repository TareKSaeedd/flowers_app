class Items {
  String itemPath;
  String location;
  String itemName;
  double itemPrice;

  Items({required this.itemPath, required this.itemName, required this.itemPrice, this.location = "main branch"});
}

final List<Items> items = [
  Items(itemPath: "assets/imgs/1.webp", itemName: "product1", itemPrice: 14.99, location: "Tareks Shop"),
  Items(itemPath: "assets/imgs/2.webp", itemName: "product2", itemPrice: 25.99),
  Items(itemPath: "assets/imgs/3.webp", itemName: "product3", itemPrice: 39.99),
  Items(itemPath: "assets/imgs/4.webp", itemName: "product4", itemPrice: 55.99),
  Items(itemPath: "assets/imgs/5.webp", itemName: "product5", itemPrice: 23.99),
  Items(itemPath: "assets/imgs/6.webp", itemName: "product6", itemPrice: 44.99),
  Items(itemPath: "assets/imgs/7.webp", itemName: "product7", itemPrice: 89.99),
  Items(itemPath: "assets/imgs/8.webp", itemName: "product8", itemPrice: 79.99),
];
