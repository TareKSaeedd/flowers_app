import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flowers_app/provider/cart.dart';
import 'package:flowers_app/constants/colors.dart';
import 'package:flowers_app/constants/app_bar.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: btnappbarGreen,
        title: Consumer<Cart>(
          builder: (context, test, child) {
            return const Text(
              "Check out info",
              style: TextStyle(color: Colors.white),
            );
          },
        ),
        actions: const [
          AppBarSceen(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 470,
            child: Consumer<Cart>(
              builder: (context, cart, child) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: cart.selectedProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SingleChildScrollView(
                          child: Card(
                            child: ListTile(
                                title: Text(cart.selectedProducts[index].itemName),
                                subtitle: Text("${cart.selectedProducts[index].itemPrice} - ${cart.selectedProducts[index].location}"),
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(cart.selectedProducts[index].itemPath),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      cart.remove(cart.selectedProducts[index]);
                                    },
                                    icon: const Icon(Icons.remove))),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(btnPink),
              padding: const WidgetStatePropertyAll(EdgeInsets.all(12)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Text(
              "Pay \$ ${cart.priceProduct}",
              style: const TextStyle(fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}
