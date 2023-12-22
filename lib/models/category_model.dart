class CategoryModel {
  final String name;
  final String img;
  CategoryModel({
    required this.name,
    required this.img,
  });
  factory CategoryModel.fromJson(String categoryName, String image) {
    return CategoryModel(name: categoryName, img: image);
  }
}
