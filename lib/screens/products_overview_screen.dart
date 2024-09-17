import 'package:flutter/material.dart';
import 'package:ictu_project/providers/card.dart';
import 'package:ictu_project/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/product_grid.dart';

enum FilterOption {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _ShowOnlyFavoritesData = false;
  // const PrudoctsOverviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
// final productContainer=Provider.of<Products>(context,listen: false);
    // final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        backgroundColor: Colors.purple,
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption value) {
              setState(() {
                if (value == FilterOption.Favorites) {
                  // productContainer.ShowFavoriteOnly();
                  _ShowOnlyFavoritesData = true;
                } else {
                  // productContainer.ShowAll();
                  _ShowOnlyFavoritesData = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only favorites'),
                value: FilterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOption.All,
              ),
            ],
            icon: Icon(
              Icons.more_vert,
            ),
          ),
          Consumer<Cart>(builder: (_, cart, ch) => Badge(
                child: ch,
          label:Text(cart.itemCount.toString())
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routename);
                },
              
            ),
          )
        ],
      ),
      body: ProductGrid(_ShowOnlyFavoritesData),
    );
  }
}
