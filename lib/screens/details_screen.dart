import 'package:flutter/material.dart';
import 'package:flowers_app/model/items.dart';
import 'package:flowers_app/constants/colors.dart';
import 'package:flowers_app/constants/app_bar.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final Items product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: btnappbarGreen,
        title: const Text("Details Screen"),
        actions: const [
          AppBarSceen()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.product.itemPath),
            const SizedBox(
              height: 11,
            ),
            Text(
              "\$ ${widget.product.itemPrice}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text('New'),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 23,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 23,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 23,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 23,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      size: 23,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.edit_location,
                      size: 23,
                      color: btnGreen,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.product.location,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Details : ",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "A flower, also known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers consist of a combination of vegetative organs – sepals that enclose and protect the developing flower. These petals attract pollinators, and reproductive organs that produce gametophytes, which in flowering plants produce gametes. The male gametophytes, which produce sperm, are enclosed within pollen grains produced in the anthers. The female gametophytes are contained within the ovules produced in the ovary.",
              style: const TextStyle(fontSize: 18),
              maxLines: isShowMore ? 3 : null,
              overflow: TextOverflow.fade,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isShowMore = !isShowMore;
                });
              },
              child: Text(
                isShowMore ? "Show more" : "Show less",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
