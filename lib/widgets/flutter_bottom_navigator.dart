import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/products.store.dart';
import 'package:provider/provider.dart';

class FlutterBottomNavigator extends StatelessWidget {
  int _active_item = 0;
  FlutterBottomNavigator(this._active_item);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).backgroundColor,
      height: 45,
      index: _active_item,
      items: <Widget>[
        Icon(Icons.home),
        Icon(Icons.list),
        _iconCart(context),
        Icon(Icons.supervised_user_circle),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/tenants');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/my-orders');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/cart');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
          default:
            Navigator.pushReplacementNamed(context, '/tenants');
        }
        ;
      },
    );
  }

  Widget _iconCart(context) {
    final storeProducts = Provider.of<ProductsStore>(context);
    return Stack(
      children: [
        Icon(Icons.shopping_cart),
        Positioned(
          right: 0,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(6)),
            constraints: BoxConstraints(
              minHeight: 12,
              minWidth: 12,
            ),
            child: Observer(
              builder: (_) {
                return Text(
                  storeProducts.cartItems.length.toString(),
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
