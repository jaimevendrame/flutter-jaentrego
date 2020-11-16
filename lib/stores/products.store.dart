import 'package:flutter/material.dart';

import '../data/network/repositories/product_repository.dart';
import 'package:mobx/mobx.dart';
import '../models/Product.dart';

part 'products.store.g.dart';

class ProductsStore = _ProductsStoreBase with _$ProductsStore;

abstract class _ProductsStoreBase with Store {
  ProductRepository _repository;

  _ProductsStoreBase() {
    _repository = new ProductRepository();
  }

  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @observable
  List<Map<String, dynamic>> cartItems = [];

  @observable
  double totalCart = 0;

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  void addProduct(Product product) {
    products.add(product);
  }

  @action
  void addAll(List<Product> products) {
    products.addAll(products);
  }

  @action
  void removeProduct(Product product) {
    products.remove(product);
  }

  @action
  void clearProducts() {
    products.clear();
  }

  @action
  Future getProducts(String tokenCompany,
      {List<String> categoriesFilter}) async {
    clearProducts();
    clearCart();
    setLoading(true);

    final response = await _repository.getProducts(tokenCompany,
        filterCategories: categoriesFilter);

    setLoading(false);

    response.map((product) => addProduct(Product.fromJson(product))).toList();
  }

  /**
   * Cart
   */

  @action
  void addProductCart(Product product) {
    print('addProductCart');

    if (inProductCart(product)) {
      return incrementProductCart(product);
    }

    cartItems.add({
      'identify': product.identify,
      'qty': 1,
      'product': product,
    });

    calcTotalCart();
  }

  @action
  void removeProductCart(Product product) {
    print('removeProductCart');

    cartItems.removeWhere((element) => element['identify'] == product.identify);

    calcTotalCart();
  }

  @action
  void clearCart() {
    print('clearCart');
    cartItems.clear();

    calcTotalCart();
  }

  @action
  void incrementProductCart(Product product) {
    final int index = cartItems
        .indexWhere((element) => element['identify'] == product.identify);

    cartItems[index]['qty'] = cartItems[index]['qty'] + 1;

    calcTotalCart();
  }

  @action
  void decrementProductCart(Product product) {
    final int index = cartItems
        .indexWhere((element) => element['identify'] == product.identify);

    cartItems[index]['qty'] = cartItems[index]['qty'] - 1;

    if (cartItems[index]['qty'] == 0) {
      return removeProductCart(product);
    }

    calcTotalCart();
  }

  @action
  bool inProductCart(Product product) {
    final int index = cartItems
        .indexWhere((element) => element['identify'] == product.identify);

    return index != -1;
  }

  @action
  double calcTotalCart() {
    double total = 0;

    cartItems
        .map((element) =>
            total += element['qty'] * double.parse(element['product'].price))
        .toList();

    totalCart = total;

    cartItems = cartItems;

    products = products;

    return total;
  }
}
