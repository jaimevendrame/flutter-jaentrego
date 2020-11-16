import 'dart:convert';

class Evaluation {
  String nameUser;
  String comment;
  double starts;

  Evaluation({this.nameUser, this.comment, this.starts});

  factory Evaluation.fromJson(jsonData) {
    return Evaluation(
      nameUser: jsonData['nameUser'],
      comment: jsonData['comment'],
      starts: jsonData['starts'],
    );
  }

  toJson() {
    return jsonEncode({
      'nameUser': nameUser,
      'comment': comment,
    });
  }
}
