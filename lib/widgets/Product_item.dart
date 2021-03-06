import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import '../screens/Product_detail_screen.dart';
import '../providers/Cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;

  // const ProductItem({Key key, this.id, this.title, this.imageUrl, this.price})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          header: Container(
              padding: EdgeInsets.all(10),
              color: Colors.black54,
              child: Text("\$ ${product.price}")),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (ctx, fav, child) => IconButton(
                  icon: Icon(product.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    product.toggleFavouriteStatus();
                  }),
            ),
            trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  cart.addItem(product.id, product.price, product.title);
                  Scaffold.of(context).removeCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Added item to cart"),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(label: "UNDO", onPressed: (){
                      cart.removeSingleItem(product.id);
                    },),
                  ));
                }),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black54,
          ),
        ),
      ),
    );
  }
}
