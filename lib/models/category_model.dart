class CategoryModel {
  String name;
  String image;

  CategoryModel(this.name, this.image);
}

List<CategoryModel> category = categoryData
    .map((item) =>
        CategoryModel(item['name'] as String, item['image'] as String))
    .toList();

var categoryData = [
  {"name": "Jacket", "image": "assets/images/jacket.png"},
  {"name": "Hoodie", "image": "assets/images/hoodie.png"},
  {"name": "Crewneck", "image": "assets/images/crewneck.png"},
  {"name": "Hat", "image": "assets/images/cap.png"},
  {"name": "Tee", "image": "assets/images/tee.png"},
];
