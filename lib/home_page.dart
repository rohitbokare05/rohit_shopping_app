import 'package:flutter/material.dart';
import 'package:shopping_app/product_list.dart';
import 'package:shopping_app/shopping_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = ['All', 'Adidas', 'Nike', 'Bata', 'Puma'];
  late String selectedFilter;
  List<Widget> pages = [const Productlist(), const shoppingCart()];

  int selectedPage = 0;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 35,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          currentIndex: selectedPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '')
          ]),
    );
  }
}
