import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  
  ProductManager(this.products);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('[Product Manager State] build()');
    return Column(
      children: <Widget>[
        Container(
          
        ),
        Expanded(
          child: Products(products),
        ),
      ],
    );
  }
}
