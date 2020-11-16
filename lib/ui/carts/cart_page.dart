import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Product.dart';
import '../../stores/products.store.dart';
import '../../stores/tenants.store.dart';
import '../../stores/orders.store.dart';

import '../../widgets/show_image_cached_network.dart';

class CartScreen extends StatelessWidget {
  ProductsStore _productsStore;
  TenantsStore _tenantsStore;
  OrderStore _orderStore;
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _productsStore = Provider.of<ProductsStore>(context);
    _tenantsStore = Provider.of<TenantsStore>(context);
    _orderStore = Provider.of<OrderStore>(context);

    final String titlePage = _tenantsStore.tenant != null
        ? "Carinho - ${_tenantsStore.tenant.name}"
        : 'Carrinho';
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(titlePage),
        centerTitle: true,
      ),
      body: _buildContentCart(context),
      bottomNavigationBar: FlutterBottomNavigator(2),
    );
  }

  Widget _buildContentCart(context) {
    return ListView(
      shrinkWrap: false,
      children: <Widget>[
        _buildHeader(),
        _buildCartList(context),
        _buildTextTotalCart(),
        _buildFormComment(context),
        _buttonCheckout(context),
      ],
    );
  }

  Widget _buildHeader() {
    return Observer(
      builder: (context) => Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.all(16),
        child: Text(
          "Total (${_productsStore.cartItems.length}) Itens",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildCartList(context) {
    return Observer(
      builder: (context) => ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: _productsStore.cartItems.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> itemCart =
                _productsStore.cartItems[index];
            return _buildCartItem(itemCart, context);
          }),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> itemCart, context) {
    final Product product = itemCart['product'];
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          height: 80,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey[200]),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Container(
            padding: EdgeInsets.all(2),
            child: Row(
              children: <Widget>[
                ShowImageCachedNetwork(product.image != null
                    ? product.image
                    : 'https://jaentrego.com.br/image/logo_jaentrego_app.png'),
                _showDetailItemCart(product, itemCart, context),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => _productsStore.removeProductCart(product),
            child: Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.only(top: 2, right: 4),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Icon(
                Icons.close,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _showDetailItemCart(product, Map<String, dynamic> itemCart, context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 5, right: 4, left: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product.title,
              maxLines: 2,
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).primaryColor),
            ),
            Container(height: 6),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("R\$ ${product.price}",
                      style: TextStyle(color: Colors.green)),
                  Container(
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () =>
                              _productsStore.decrementProductCart(product),
                          child: Icon(Icons.remove,
                              size: 24, color: Colors.grey.shade700),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 12, right: 12),
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            itemCart['qty'].toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              _productsStore.incrementProductCart(product),
                          child: Icon(Icons.add,
                              size: 24, color: Colors.grey.shade700),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextTotalCart() {
    return Observer(
      builder: (context) => Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 26, bottom: 16),
        child: Text(
          "Total: R\$ ${_productsStore.totalCart}",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildFormComment(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: _commentController,
        autocorrect: true,
        style: TextStyle(color: Theme.of(context).primaryColor),
        cursorColor: Theme.of(context).primaryColor,
        onSaved: (newValue) {
          print(newValue);
        },
        decoration: InputDecoration(
          labelText: 'Comentário (ex: sem cebola)',
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        ),
      ),
    );
  }

  Widget _buttonCheckout(context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 50, right: 10, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.orange[800],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6,
            )
          ]),
      child: Observer(
        builder: (context) => RaisedButton(
          onPressed: () =>
              _orderStore.isMakingOrder ? null : _makeOrder(context),
          child: _orderStore.isMakingOrder
              ? Text('Fazendo o pedido...')
              : Text('Finalizar Pedido'),
          color: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  Future _makeOrder(context) async {
    await _orderStore.makeOrder(
      _tenantsStore.tenant.uuid,
      _productsStore.cartItems,
      comment: _commentController.text,
    );

    _productsStore.clearCart();
    _commentController.text = '';

    Navigator.pushReplacementNamed(context, '/my-orders');
  }
}
