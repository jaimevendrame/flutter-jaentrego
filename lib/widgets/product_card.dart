import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../stores/products.store.dart';
import '../models/Product.dart';

class ProductCard extends StatelessWidget {
  bool notShowiconCart;
  Product product;

  // ProductsStore storeProducts = new ProductsStore();

  ProductCard({this.notShowiconCart = false, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.5,
        child: Container(
          padding: EdgeInsets.all(8),
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[100]),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white,
          ),
          child: Container(
            child: Row(children: <Widget>[
              _buildImageProduct(),
              // VerticalDivider(color: Colors.black54),
              _buildInfoProduct(),
              _buildButtonCard(context),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildImageProduct() {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.only(right: 8),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: product.image != ''
              ? product.image
              : 'https://jaentrego.com.br/image/logo_jaentrego_app.png',
          placeholder: (context, url) => Container(
            height: 80,
            width: 80,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoProduct() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(product.title,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          Container(height: 5),
          Text(product.description,
              style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              )),
          Container(height: 7),
          Text("R\$ ${product.price}",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }

  Widget _buildButtonCard(context) {
    final storeProducts = Provider.of<ProductsStore>(context);
    return notShowiconCart
        ? Container()
        : Container(
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: storeProducts.inProductCart(product)
                  ? GestureDetector(
                      onTap: () => storeProducts.removeProductCart(product),
                      child: Icon(
                        Icons.remove_shopping_cart,
                        color: Colors.red,
                      ),
                    )
                  : GestureDetector(
                      onTap: () => storeProducts.addProductCart(product),
                      child: Icon(Icons.shopping_cart),
                    ),
            ),
          );
  }
}
