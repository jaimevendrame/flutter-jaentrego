// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderStore on _OrderStoreBase, Store {
  final _$isMakingOrderAtom = Atom(name: '_OrderStoreBase.isMakingOrder');

  @override
  bool get isMakingOrder {
    _$isMakingOrderAtom.reportRead();
    return super.isMakingOrder;
  }

  @override
  set isMakingOrder(bool value) {
    _$isMakingOrderAtom.reportWrite(value, super.isMakingOrder, () {
      super.isMakingOrder = value;
    });
  }

  final _$makeOrderAsyncAction = AsyncAction('_OrderStoreBase.makeOrder');

  @override
  Future<dynamic> makeOrder(
      String tokenCompany, List<Map<String, dynamic>> products,
      {String comment}) {
    return _$makeOrderAsyncAction
        .run(() => super.makeOrder(tokenCompany, products, comment: comment));
  }

  @override
  String toString() {
    return '''
isMakingOrder: ${isMakingOrder}
    ''';
  }
}
