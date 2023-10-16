// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistItemRemovedFromWishlistEvent extends WishlistEvent {
  final ProductDataModel productDataModel;
  WishlistItemRemovedFromWishlistEvent({
    required this.productDataModel,
  });
}
