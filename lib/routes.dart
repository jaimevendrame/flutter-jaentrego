import 'package:flutter/material.dart';

import './ui/auth/login_page.dart';
import './ui/auth/register_page.dart';
import './ui/tenants/tenants_page.dart';
import './ui/products/products_page.dart';
import './ui/carts/cart_page.dart';
import './ui/orders/orders_page.dart';
import './ui/order_details/order_details.dart';
import './ui/evaluation_order/evaluation_order.dart';
import './ui/profile/profile_page.dart';
import './ui/speech/speech_page.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    '/': (context) => SpeechScreen(),
    '/login': (context) => LoginScreen(),
    '/register': (context) => RegisterScreen(),
    '/tenants': (context) => TenantsPage(),
    '/products': (context) => ProductsScreen(),
    '/cart': (context) => CartScreen(),
    '/my-orders': (context) => OrdersScreen(),
    '/order-details': (context) => OrderDetailsScreen(),
    '/evaluation-order': (context) => EvaluationScreen(),
    '/profile': (context) => ProfileScreen(),
  };
}
