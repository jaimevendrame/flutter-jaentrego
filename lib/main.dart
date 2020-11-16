import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './constants/app_theme.dart';
import './routes.dart';
import './stores/products.store.dart';
import './stores/categories.store.dart';
import './stores/tenants.store.dart';
import './stores/orders.store.dart';
import './stores/auth.store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductsStore>(
          create: (_) => ProductsStore(),
        ),
        Provider<CategoriesStore>(
          create: (_) => CategoriesStore(),
        ),
        Provider<TenantsStore>(
          create: (_) => TenantsStore(),
        ),
        Provider<OrderStore>(
          create: (_) => OrderStore(),
        ),
        Provider<AuthStore>(
          create: (_) => AuthStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JaEntrego',
        theme: themeData,
        initialRoute: '/',
        routes: Routes.routes,
      ),
    );
  }
}
