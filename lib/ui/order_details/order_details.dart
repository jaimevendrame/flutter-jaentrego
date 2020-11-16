import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/Order.dart';
import '../../models/Product.dart';
import '../../models/Evaluation.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../widgets/product_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  Order _order = Order(
    identify: '322323khjh32',
    date: '30/02/2021',
    status: 'open',
    table: 'Mesa xY',
    total: (90).toDouble(),
    comment: 'Sem cebola',
    products: [
      Product(
        identify: '090212njn199',
        image:
            'https://jaentrego.com.br/image/pexels-daria-shevtsova-1260968.jpg',
        description: 'Apenas um teste',
        price: '16,2',
        title: 'Pizzas',
      ),
      Product(
        identify: '090212njn199',
        image:
            'https://jaentrego.com.br/image/pexels-madison-inouye-2173772.jpg',
        description: 'Apenas um teste',
        price: '10,4',
        title: 'Açai',
      ),
    ],
    evaluations: [
      // Evaluation(
      //   comment: 'Pedido muito bom',
      //   nameUser: 'Carlos',
      //   starts: 4,
      // ),
      // Evaluation(
      //   comment: 'Pedido muito bom',
      //   nameUser: 'Jorge',
      //   starts: 5,
      // ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes do Pedido'), centerTitle: true),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(child: _buildOrderDetails(context)),
      bottomNavigationBar: FlutterBottomNavigator(1),
    );
  }

  Widget _buildOrderDetails(context) {
    return Container(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _maketextOrder('Número', _order.identify),
            _maketextOrder('Data', _order.date),
            _maketextOrder('Status', _order.status),
            _maketextOrder('Total', _order.total.toString()),
            _maketextOrder('Mesa', _order.table),
            _maketextOrder('Comentário', _order.comment),
            Container(height: 30),
            Text('Produtos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
            _buildProdutosOrder(context),
            Container(height: 30),
            Text('Avaliações',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
            _buildEvaluationsOrder(context),
          ],
        ));
  }

  Widget _maketextOrder(String textLabel, String textValue) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: <Widget>[
          Text(
            textLabel + ': ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            textValue + ': ',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildProdutosOrder(context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _order.products.length,
        itemBuilder: (context, index) {
          final Product product = _order.products[index];
          return ProductCard(
            product: product,
            notShowiconCart: true,
          );
        },
      ),
    );
  }

  Widget _buildEvaluationsOrder(context) {
    return _order.evaluations.length > 0
        ? Container(
            padding: EdgeInsets.only(left: 10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _order.evaluations.length,
              itemBuilder: (context, index) {
                final Evaluation evaluation = _order.evaluations[index];
                return _buildEvaluationItem(evaluation, context);
              },
            ),
          )
        : Container(
            height: 40,
            margin: EdgeInsets.only(top: 10, bottom: 30),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/evaluation-order');
              },
              color: Colors.orange,
              elevation: 2.2,
              child: Text('Avaliar o Pedido'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.orangeAccent)),
            ),
          );
  }

  Widget _buildEvaluationItem(Evaluation evaluation, context) {
    return Card(
      elevation: 2.5,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(color: Colors.grey[100]),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RatingBar(
              initialRating: evaluation.starts,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 12,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: null,
            ),
            Row(
              children: <Widget>[
                Text(
                  "${evaluation.nameUser} - ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${evaluation.comment}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
