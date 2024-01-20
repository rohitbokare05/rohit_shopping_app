import 'package:flutter/material.dart';
import 'package:shopping_app/global_values.dart';
import 'package:shopping_app/product_details.dart';
import 'package:shopping_app/products_cart.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  final List<String> filters = ['All', 'Adidas', 'Nike', 'Bata', 'Puma'];
  late String selectedFilter;

  int selectedPage = 0;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Shoes\nCollectionsss',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(50)),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(225, 225, 225, 1))),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 16,
                    )),
              )),
            ]),
            SizedBox(
              height: 80,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                          label: Text(filters[index]),
                          shadowColor: Colors.black,
                          backgroundColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromRGBO(197, 198, 200, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // const SizedBox(
            //   height: 120,
            // ),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: ((context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProductDetails(product: product);
                        }));
                      },
                      child: ProductCart(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
