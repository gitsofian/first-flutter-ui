import 'package:flutter/material.dart';

import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final bool favoritProduct = true;

  Products(this.products) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductList() {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return ProductCard(products[index], index);
            },
            itemCount: products.length,
          )
        : Center(
            child: Text('No product found! please add some data'),
          );
  }

  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
