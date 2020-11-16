import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';

class OrdersScreen extends StatelessWidget {
  List<Order> _orders = [
    new Order(date: '30/02/2021', identify: '098d90asds90d'),
    new Order(date: '23/02/2021', identify: '23232xxxx2311'),
    new Order(date: '12/03/2021', identify: '3l2kjn3lk2323'),
    new Order(date: '14/03/2021', identify: '43443sdsdd232'),
    new Order(date: '20/04/2021', identify: '232323xxx2xzZ'),
    new Order(date: '21/04/2021', identify: '121212cxcsdsq'),
    new Order(date: '09/05/2021', identify: '76767dsds2ew2'),
    new Order(date: '21/05/2021', identify: '12121xsaswhhh'),
    new Order(date: '27/05/2021', identify: 'fdefd34343sxs'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meus Pedidos'), centerTitle: true),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildOrderScreen(context),
      bottomNavigationBar: FlutterBottomNavigator(1),
    );
  }

  Widget _buildOrderScreen(context) {
    return Column(
      children: <Widget>[
        _buildHeader(),
        _buildOrdersList(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      child: Text(
        'Meus Pedidos',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildOrdersList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final Order order = _orders[index];
          return _buildItemOrder(order, context);
        },
      ),
    );
  }

  Widget _buildItemOrder(Order order, context) {
    return ListTile(
      title: Text(
        "Pedido #${order.identify}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      subtitle: Text(
        "${order.date}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      trailing: IconTheme(
        data: IconThemeData(color: Theme.of(context).primaryColor),
        child: Icon(Icons.navigate_next),
      ),
      onTap: () {
        print(order.identify);
        Navigator.pushNamed(context, '/order-details',
            arguments: order.identify);
      },
    );
  }
}
