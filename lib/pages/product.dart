import 'package:flutter/material.dart';

import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imageUrl, this.price, this.description);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be un done!'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  Widget _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Celle, Hannover',
          style: TextStyle(fontFamily: 'Montserrat', color: Colors.red, fontSize: 14.0, fontWeight: FontWeight.w800)
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text('|', style: TextStyle(color: Colors.grey)),
          ),
        Text('\$ ' + price.toString(),style: TextStyle(fontFamily: 'Montserrat', color: Colors.grey),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        print('Back btn pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: TitleDefault(title),
          ),
          body: Center(
            child: Column(
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TitleDefault(title),
              ),
              _buildAddressPriceRow(),
              Container(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text('DELETE!'),
                  onPressed: () {
                    return _showWarningDialog(context);
                  },
                ),
              )
            ],
          ))),
    );
  }
}
