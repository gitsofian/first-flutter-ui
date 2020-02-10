import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  ProductCreatePage(this.addProduct) {}

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _title;
  double _price;
  String _description;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: const InputDecoration(
          icon: Icon(Icons.title),
          labelText: 'Product title',
          hintText: 'Enter Product title'),
      autofocus: true,
      autovalidate: true,
      validator: (String value) {
        if (value.isEmpty){
          return 'Title is required';
        }
      },
      onSaved: (String value) {
        setState(() {
          _title = value;
        });
      },
    );
  }

  Widget _buildProductDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Description'),
      maxLines: 4,
      onSaved: (String value) {
        setState(() {
          _description = value;
        });
      },
      onChanged: (String value) {
        
      },
    );
  }

  Widget _buildProductPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        setState(() {
          _price = double.parse(value);
        });
      },
      onChanged: (String value) {
        setState(() {
          //_price = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _title,
      'description': _description,
      'price': _price,
      'imageUrl': 'assets/foods.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.10),
      child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTitleTextField(),
              _buildProductDescriptionTextField(),
              _buildProductPriceTextField(),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text('Save'),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: _submitForm,
              )
              /* TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'what do people call you? ',
                labelText: 'Name *',
              ),
            ), */
            ],
          )),
    );
  }
}
