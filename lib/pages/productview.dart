import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:machine_test3_api2/pages/productlist.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key, required this.productTitle, required this.productImage,required this.productRate}) : super(key: key);
  ProductList productTitle;
  ProductList productImage;
  ProductList productRate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 4, 153, 245)),
        title: Text(
          'Product Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            // child: Image.network(productTitle),
          ),
        ],
      )),
    );
  }
}
