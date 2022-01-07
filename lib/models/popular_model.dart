class PopularModel {
  String name;
  String price;
  String image;

  PopularModel(this.name, this.price, this.image);
}

List<PopularModel> populars = popularsData
    .map((item) => PopularModel(item['name'] as String, item['price'] as String,
        item['image'] as String))
    .toList();

var popularsData = [
  {
    "name": "Escape, A Dickies Jacket (Red)",
    "price": "\$ 150.00",
    "image": "assets/images/real_jacket_red.jpg"
  },
  {
    "name": "Escape, A Dickies Jacket (Olive Green)",
    "price": "\$ 150.00",
    "image": "assets/images/real_jacket_green.png"
  },
  {
    "name": "Purple Emperor, A Crewneck",
    "price": "\$ 110.00",
    "image": "assets/images/real_crewneck.png"
  },
  {
    "name": "Rebirth T-Shirt",
    "price": "\$ 50.00",
    "image": "assets/images/real_tee.png"
  },
];
