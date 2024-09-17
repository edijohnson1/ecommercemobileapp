
import 'package:flutter/material.dart';
import 'package:ictu_project/providers/Products.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';



class ProductGrid extends StatelessWidget {
  final bool ShowFavs;
  ProductGrid(this.ShowFavs);
  
  @override
  Widget build(BuildContext context) {
   final productData= Provider.of<Products>(context);
   final produtcs=ShowFavs ? productData.favoriteItems : productData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value:  produtcs[index],
        child: ProductItem(
          //  
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: produtcs.length,
    );
  }}