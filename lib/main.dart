import 'package:flutter/material.dart';
import 'package:ictu_project/providers/Products.dart';
import 'package:ictu_project/providers/card.dart';
import 'package:ictu_project/screens/cart_screen.dart';
import 'package:ictu_project/screens/product_detail_screen.dart';
import 'package:ictu_project/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        )
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Lato',
        ),
        // home: ProductsOverviewScreen(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routename:(ctx) =>CartScreen(), 
        },
      ),
    );
  }
}
