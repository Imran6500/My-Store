// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccesState extends CartState {
  final List<ProductDataModel> cartItems;
  CartSuccesState({
    required this.cartItems,
  });
}

class CartedItemRemovedState extends CartActionState {}
