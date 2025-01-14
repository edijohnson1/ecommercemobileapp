import 'package:flutter/material.dart';
import 'package:ictu_project/providers/Products.dart';
import 'package:ictu_project/providers/card.dart';
import 'package:ictu_project/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({super.key});
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(
  //   this.id,
  //   this.title,
  //   this.imageUrl,
  // );

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart=Provider.of<Cart>(context,listen: false);
    return  ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading:Consumer<Product>(
                      builder: (context, product, _) => IconButton(
              icon: Icon(product.isFavorite ? Icons.favorite :Icons.favorite_border),
              color: Colors.deepOrange,
              onPressed: () {
                product.toggleFavoriteState();
      
              },
            ),),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.deepOrange,
              onPressed: () {
                cart.addItem(product.id,product.price,product.title, );
              },
            ),
          ),
        ),
    );
  }
}
