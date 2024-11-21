import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flowers_app/provider/cart.dart';
import 'package:flowers_app/screens/check_out.dart';

class AppBarSceen extends StatelessWidget {
  const AppBarSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: ((context, cart, child) {
      return Row(
        children: [
          Stack(
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(color: Color.fromARGB(211, 164, 255, 193), shape: BoxShape.circle),
                  child: Text(
                    "${cart.selectedProducts.length}",
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckOut(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_shopping_cart)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text("${cart.priceProduct}"),
          )
        ],
      );
    }));
  }
}
