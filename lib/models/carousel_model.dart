class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels = carouselsData
    .map((item) => CarouselModel(item['image'] as String))
    .toList();

var carouselsData = [
  {"image": "assets/images/carousel_1.jpg"},
  {"image": "assets/images/carousel_2.jpg"},
  {"image": "assets/images/carousel_3.jpg"},
];
