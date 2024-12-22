import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flowers_app/model/items.dart';
import 'package:flowers_app/provider/cart.dart';

import 'package:flowers_app/constants/colors.dart';
import 'package:flowers_app/screens/check_out.dart';
import 'package:flowers_app/constants/app_bar.dart';
import 'package:flowers_app/screens/details_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 33,
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: items[index],
                    ),
                  ),
                );
              },
              child: GridTile(
                footer: GridTileBar(
                  trailing: Consumer<Cart>(builder: ((context, cart, child) {
                    return IconButton(
                      color: Colors.black,
                      onPressed: () {
                        cart.add(items[index]);
                      },
                      icon: const Icon(Icons.add),
                    );
                  })),
                  leading: Text(items[index].itemPrice.toString()),
                  title: const Text(""),
                ),
                child: Stack(children: [
                  Positioned(
                    top: -3,
                    bottom: -9,
                    right: 0,
                    left: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                      child: Image.asset(items[index].itemPath),
                    ),
                  )
                ]),
              ),
            );
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: btnappbarGreen,
        title: Consumer<Cart>(
          builder: (context, test, child) {
            return const Text("FLowers shop");
          },
        ),
        actions: const [
          AppBarSceen()
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/imgs/sky.jpg"), fit: BoxFit.cover),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/imgs/me.jpg"),
                  ),
                  accountName: Text('Tarek_Saeed'),
                  accountEmail: Text('Tareksaeed@gmail.com'),
                ),
                ListTile(
                  title: const Text('Home'),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                ),
                ListTile(
                    title: const Text("My products"),
                    leading: const Icon(Icons.add_shopping_cart),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CheckOut()),
                      );
                    }),
                ListTile(title: const Text("About"), leading: const Icon(Icons.help_center), onTap: () {}),
                ListTile(
                    title: const Text("Logout"),
                    leading: const Icon(Icons.exit_to_app),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
                    }),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: const Text(
                'Developed by Tarek Saeed',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
