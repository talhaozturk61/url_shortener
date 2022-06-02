import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:storm/deneme2.dart';
import 'package:storm/getx_controller.dart';

class Deneme extends StatefulWidget {
  const Deneme({Key? key}) : super(key: key);

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  final productservice = GetIt.I<ProductService>();
  final shoppingCart = GetIt.I<ShoppingCartService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: productservice.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(productservice.products[index].name),
              trailing: IconButton(
                  onPressed: () {
                    shoppingCart.cart.add(productservice.products[index].id, 1);
                  },
                  icon: const Icon(Icons.shop)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (builder) => Deneme2()));
        },
        child: const Icon(Icons.shopping_bag),
      ),
    );
  }
}
