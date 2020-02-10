import 'package:flutter/material.dart';
import 'package:flutter_course/pages/auth.dart';

import './pages/products.dart';
import './pages/product.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';

void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
    print(product);
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        fontFamily: 'Montserrat',
      ),
      routes: {
        '/': (BuildContext context) {
          return AuthPage();
        },
        '/products': (BuildContext context) {
          return ProductsPage(_products);
        },
        '/admin': (BuildContext context) {
          return ProductsAdminPage(_addProduct, _deleteProduct);
        },
      },
      onGenerateRoute: (RouteSettings setting) {
        final List<String> pathElements = setting.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(builder: (BuildContext context) {
            return ProductPage(
                _products[index]['title'],
                _products[index]['imageUrl'],
                _products[index]['price'],
                _products[index]['description']);
          });
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return ProductsPage(_products);
        });
      },
    );
  }
}
