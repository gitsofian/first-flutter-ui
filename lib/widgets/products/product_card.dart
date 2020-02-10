import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/ui_elements/address_tag.dart';
import 'package:flutter_course/widgets/ui_elements/title_default.dart';

import './price_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['imageUrl']),
          Container(
              padding: EdgeInsets.all(10),
              //color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TitleDefault(product['title']),
                  SizedBox(
                    height: 8,
                  ),
                  PriceTag(product['price'].toString()),
                ],
              )),
              AddressTag('Hannover, Celle'),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.info),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.pushNamed<bool>(
                        context, '/product/' + productIndex.toString());
                  }),
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () => {
                  Navigator.pushNamed<bool>(
                      context, '/product/' + productIndex.toString())
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
