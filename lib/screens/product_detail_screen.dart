import 'package:flutter/material.dart';
import 'package:ictu_project/providers/Products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/productScreen';
  // const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
   final loadedproduct= Provider.of<Products>(context,listen: false).finfById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedproduct.title),
      ),
      body: null,
    );
  }
}
