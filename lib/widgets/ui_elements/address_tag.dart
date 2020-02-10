import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {

  final String address;
  
  AddressTag(this.address);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Text(address),
    );
    throw UnimplementedError();
  }
}
