import 'package:flutter/material.dart';
import 'package:ictu_project/providers/card.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routename = '/cartScreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  TextButton(onPressed: () {}, child: Text('ORDER NOW'))
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) => ci.CartItem(
              cart.items.values.toList()[index].id,
              cart.items.values.toList()[index].price,
              cart.items.values.toList()[index].quantity,
              cart.items.values.toList()[index].title,
            ),
            itemCount: cart.itemCount,
          ))
        ],
      ),
    );
  }
}
