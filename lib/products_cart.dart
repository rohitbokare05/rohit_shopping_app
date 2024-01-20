import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  final String title;
  final String image;
  final double price;
  const ProductCart({
    required this.title,
    required this.image,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.all(20),
      color: const Color.fromRGBO(216, 240, 253, 1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Image(
              image: AssetImage(image),
              height: 150,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ]),
      ),
    );
  }
}
