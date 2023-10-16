import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/data/wishlist_items.dart';
import 'package:mystore/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:mystore/features/wishlist/ui/Wishlist_tile_widgets.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wishlisted Items'),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
            bloc: wishlistBloc,
            listenWhen: (previous, current) => current is WishlistActionState,
            buildWhen: (previous, current) => current is! WishlistActionState,
            listener: (context, state) {
              if (state is WishlistedItemRemovedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Item removed from wishlist')));
              }
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case WishlistSuccessState:
                  final successState = state as WishlistSuccessState;

                  return wishlistItems.isNotEmpty
                      ? ListView.builder(
                          itemCount: successState.wishlistItems.length,
                          itemBuilder: (context, index) {
                            return WishlistWidget(
                                productDataModel:
                                    successState.wishlistItems[index],
                                wishlistBloc: wishlistBloc);
                          })
                      : const Center(
                          child: Text(
                          'Wishlist is Empty!',
                          style: TextStyle(fontSize: 20),
                        ));
                default:
              }
              return Container();
            }));
  }
}
