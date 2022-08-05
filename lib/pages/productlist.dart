import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test3_api2/model/model.dart';
import 'package:machine_test3_api2/pages/productview.dart';

Future<List<Products>> fetchProducts() async {
  print('------------------------');
  http.Response responseData = await http.get(
    Uri.parse('https://fakestoreapi.com/products?limit=5'),
  );

  if (responseData.statusCode == 200) {
    final parsedData =
        json.decode(responseData.body).cast<Map<String, dynamic>>();

    print(parsedData);
    return parsedData.map<Products>((json) => Products.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}



class ProductList extends StatefulWidget {
  ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late final Future<List<Products>> futureList;

  @override
  void initState() {
    super.initState();
    futureList = fetchProducts();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Products>>(
        future: futureList,
        builder: (context, snapshot) {
          print('-----------------------------------------------------------');
          print(snapshot.data);
          if (snapshot.hasData) {
            
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          child: Image.network(
                              snapshot.data![index].image.toString())),
                      title: Text(snapshot.data![index].title.toString()),
                      subtitle: Column(
                        children: [
                          Text(snapshot.data![index].description.toString()),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Category: ${snapshot.data![index].category.toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      trailing:
                          Text('\$${snapshot.data![index].price.toString()}'),
                    ),
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

