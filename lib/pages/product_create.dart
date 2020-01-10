import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductCreatePage extends StatefulWidget {
  
  final Function addProduct;
  ProductCreatePage(this.addProduct){

  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String title;
  double price;
  String description;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.all(10.10),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Product title', hintText: 'Enter Product title'),
              autofocus: true,
              onChanged: (String value) {
                setState(() {
                  title = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Product Description'),
              maxLines: 4,
              onChanged: (String value) {
                setState(() {});
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Product Price'),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  price = double.parse(value);
                });
              },
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                final Map<String, dynamic> product = {
                  'title': title,
                  'description': description,
                  'price': price,
                  'imageUrl': 'assets/foods.jpg'
                };
                widget.addProduct(product);

              },
            )
            /* TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'what do people call you? ',
                labelText: 'Name *',
              ),
            ), */
          ],
        ));
  }
}
