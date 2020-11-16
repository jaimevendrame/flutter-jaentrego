import 'package:mobx/mobx.dart';

import '../data/network/repositories/order_repository.dart';

part 'orders.store.g.dart';

class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {
  OrderRepository _orderRepository = OrderRepository();
  @observable
  bool isMakingOrder = false;

  @action
  Future makeOrder(String tokenCompany, List<Map<String, dynamic>> products,
      {String comment}) async {
    isMakingOrder = true;

    await _orderRepository.makeOrder(tokenCompany, products, comment: comment);

    isMakingOrder = false;
  }
}
