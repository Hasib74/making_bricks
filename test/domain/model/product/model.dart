class Product {
  // {"userId": 1, "id": 2, "title": "mock"}

  int? userId;
  int? id;
  String? title;

  Product({this.userId, this.id, this.title});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
