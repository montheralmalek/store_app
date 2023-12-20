class CategoryModel {
  final String name;
  CategoryModel({required this.name});
  factory CategoryModel.fromJson(String categoryName) {
    return CategoryModel(name: categoryName);
  }
}
