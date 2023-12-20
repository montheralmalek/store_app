class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String img;
  final Rating rating;
  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.img,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: double.parse(jsonData['price'].toString()),
        description: jsonData['description'],
        category: jsonData['category'],
        img: jsonData['image'],
        rating: Rating.fromJson(jsonData['rating']));
  }
}

class Rating {
  final double rate;
  final int count;
  Rating({required this.rate, required this.count});
  factory Rating.fromJson(jsonData) {
    return Rating(
        rate: double.parse(jsonData['rate'].toString()),
        count: jsonData['count']);
  }
}
