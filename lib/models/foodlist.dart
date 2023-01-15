class Food {
  String title;
  int price;
  int qty;
  String imageUrl;
  double total;
  double total1;
  Food(
      {required this.title,
      required this.price,
      required this.qty,
      required this.imageUrl,
      required this.total,
      required this.total1});
}

List<Food> foodlist = [
  Food(
      title: 'ส้มตำ',
      price: 100,
      qty: 0,
      imageUrl: "assets/somtum.png",
      total: 0,
      total1: 0),
  Food(
      title: 'ลาบ',
      price: 70,
      qty: 0,
      imageUrl: "assets/lap.png",
      total: 0,
      total1: 0),
  Food(
      title: 'น้ำตก1',
      price: 45,
      qty: 0,
      imageUrl: "assets/namtok.png",
      total: 0,
      total1: 0),
  Food(
      title: 'น้ำตก2',
      price: 80,
      qty: 0,
      imageUrl: "assets/namtok.png",
      total: 0,
      total1: 0),
  Food(
      title: 'น้ำตก3',
      price: 110,
      qty: 0,
      imageUrl: "assets/namtok.png",
      total: 0,
      total1: 0),
];

class FoodTest {
  String title;
  int price;
  int qty;
  String imageUrl;
  double total;
  double total1;
  FoodTest(
      {required this.title,
      required this.price,
      required this.qty,
      required this.imageUrl,
      required this.total,
      required this.total1});
}

List<FoodTest> listFoodTest = [];
