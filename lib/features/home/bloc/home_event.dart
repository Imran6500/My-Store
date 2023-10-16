// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeWishlistNavigationEvent extends HomeEvent {}

class HomeCartNavigationEvent extends HomeEvent {}
