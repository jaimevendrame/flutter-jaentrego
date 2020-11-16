import 'dart:convert';

import 'Product.dart';
import './Evaluation.dart';

class Order {
  String identify;
  String date;
  String status;
  String table;
  double total;
  String comment;
  List<Product> products;
  List<Evaluation> evaluations;

  Order(
      {this.identify,
      this.date,
      this.status,
      this.table,
      this.total,
      this.comment,
      this.products,
      this.evaluations});

  factory Order.fromJson(jsonData) {
    return Order(
      identify: jsonData['identify'],
      date: jsonData['date'],
      status: jsonData['stastus'],
      table: jsonData['table'],
      total: double.parse(jsonData['total']),
      comment: jsonData['comment'],
      products: jsonData['products'],
      evaluations: jsonData['evalauations'],
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'date': date,
      'status': status,
      'table': table,
      'total': total,
      'comment': comment,
      'products': products,
      'evaluations': evaluations,
    });
  }
}
