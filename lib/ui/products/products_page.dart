import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../models/Tenant.dart';
import '../../models/Product.dart';
import './widgets/Categories.dart';
import '../../widgets/product_card.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../stores/products.store.dart';
import '../../stores/categories.store.dart';
import '../../stores/tenants.store.dart';

import '../../widgets/custom_circular_progress_indicator.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  Tenant _tenant;
  // ProductsStore storeProducts = new ProductsStore();
  ProductsStore storeProducts;
  CategoriesStore storeCategories;
  TenantsStore storeTenants;
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    storeProducts = Provider.of<ProductsStore>(context);
    storeCategories = Provider.of<CategoriesStore>(context);
    storeTenants = Provider.of<TenantsStore>(context);

    RouteSettings settings = ModalRoute.of(context).settings;
    _tenant = settings.arguments;

    disposer =
        reaction((_) => storeCategories.filterChanged, (filtersChanged) async {
      if (!storeCategories.isLoading && !storeProducts.isLoading) {
        await storeProducts.getProducts(_tenant.uuid,
            categoriesFilter: storeCategories.filtersCategory);
      }
    });

    storeTenants.setTenant(_tenant);
    storeCategories.getCategories(_tenant.uuid);
    storeProducts.getProducts(_tenant.uuid);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      appBar: AppBar(
        title: Text(_tenant.name),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreen(),
      bottomNavigationBar: FlutterBottomNavigator(0),
    );
  }

  Widget _buildScreen() {
    return Column(
      children: <Widget>[
        Observer(
          builder: (context) {
            return storeCategories.isLoading
                ? CustomCircularProgressIndicator(
                    textLabel: 'Carregando as categorias...')
                : storeCategories.categories.length == 0
                    ? Center(
                        child: Text(
                          'Nenhuma categoria',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : Categories(storeCategories.categories);
          },
        ),
        Observer(
          builder: (context) {
            return storeProducts.isLoading
                ? CustomCircularProgressIndicator(
                    textLabel: 'Carregadando os produtos',
                  )
                : storeProducts.products.length == 0
                    ? Center(
                        child: Text(
                          'Nenhum Produto',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : _buildProducts();
          },
        ),
      ],
    );
  }

  Widget _buildProducts() {
    return Container(
      height: (MediaQuery.of(context).size.height - 210),
      width: MediaQuery.of(context).size.width,
      // color: Colors.black,
      child: ListView.builder(
        itemCount: storeProducts.products.length,
        itemBuilder: (context, index) {
          // if storeProducts.products[index] {storeProducts.clearProducts()} ;
          final Product product = storeProducts.products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
