import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:storm/getx_controller.dart';

class Deneme2 extends StatefulWidget {
  Deneme2({Key? key}) : super(key: key);

  @override
  State<Deneme2> createState() => _Deneme2State();
}

class _Deneme2State extends State<Deneme2> {
  final cart = GetIt.I<ShoppingCartService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.cart.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cart.cart.items[index].product.name),
                        Text(cart.cart.items[index].product.price.toString()),
                        Text(cart.cart.items[index].quantity.toString()),
                        Text(cart.cart.items[index].amount.toString()),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                cart.cart
                                    .remove(cart.cart.items[index].product.id);
                              });
                            },
                            icon: const Icon(Icons.remove))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Text(cart.cart.grandTotal.toString()),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  cart.cart.clear();
                });
              },
              child: const Text('Temizle'))
        ],
      ),
    );
  }
}
