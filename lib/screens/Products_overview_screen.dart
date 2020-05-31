import 'package:flutter/material.dart';

import '../widgets/ProductsGrid.dart';

class ProductOverviewScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Shop")),
      body: ProductsGrid(),
    );
  }
}
