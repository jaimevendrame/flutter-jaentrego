import 'dart:convert';

class Product {
  String identify;
  String title;
  String description;
  String price;
  String image;

  Product(
      {this.identify, this.title, this.description, this.image, this.price});

  factory Product.fromJson(jsonData) {
    return Product(
      identify: jsonData['identify'],
      title: jsonData['title'],
      description: jsonData['description'],
      image: jsonData['image'],
      price: jsonData['price'].toString(),
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
    });
  }
}
