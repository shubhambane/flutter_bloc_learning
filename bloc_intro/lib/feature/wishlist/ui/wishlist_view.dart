import 'package:flutter/material.dart';

class WishlistView extends StatefulWidget {
  WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('WishlistView'),
    ));
  }
}
