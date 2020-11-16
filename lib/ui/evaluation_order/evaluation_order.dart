import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/flutter_bottom_navigator.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar o pedido'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: _buildScreenEvaluationOrder(context),
      bottomNavigationBar: FlutterBottomNavigator(1),
    );
  }

  Widget _buildScreenEvaluationOrder(context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildHeader(context),
          Container(height: 20),
          _buildFormEvaluation(context),
        ],
      ),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      child: Text(
        "Avaliar o Pedido: 3213232dsds",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildFormEvaluation(context) {
    return Container(
      child: Column(
        children: <Widget>[
          RatingBar(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) {
              print(value);
            },
          ),
          Container(height: 14),
          TextFormField(
            autocorrect: true,
            style: TextStyle(color: Theme.of(context).primaryColor),
            cursorColor: Theme.of(context).primaryColor,
            onSaved: (newValue) {
              print(newValue);
            },
            decoration: InputDecoration(
              labelText: 'Comentário (ex: Muito bom)',
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
            ),
          ),
          Container(height: 14),
          Container(
            // margin: EdgeInsets.only(top: 10, bottom: 30),
            child: RaisedButton(
              onPressed: () {
                print('avaliar o pedido');
              },
              color: Theme.of(context).primaryColor,
              elevation: 2.2,
              child: Text(
                'Avaliar o Pedido',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
