import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/data/cart_items.dart';
import 'package:mystore/features/cart/bloc/cart_bloc.dart';
import 'package:mystore/features/cart/ui/cart_tile_widgets.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartedItemRemovedState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item removed from cart')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccesState:
              final successState = state as CartSuccesState;
              return cartListItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: successState.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartTileWidget(
                            productDataModel: successState.cartItems[index],
                            cartBloc: cartBloc);
                      })
                  : const Center(
                      child: Text(
                      'Cart is Empty!',
                      style: TextStyle(fontSize: 20),
                    ));
            default:
          }
          return Container();
        },
      ),
    );
  }
}
