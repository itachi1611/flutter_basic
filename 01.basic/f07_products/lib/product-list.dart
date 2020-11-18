import 'package:f07_products/product-edit.dart';
import 'package:f07_products/product-model.dart';
import 'package:flutter/material.dart';

typedef ProductConsumer(Product p);

class ProductList extends StatefulWidget {
  final model = ProductModel();
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.local_florist),
        title: Text("Products"),
      ),
      body: ListView.builder(
          itemCount: widget.model.products.length,
          itemBuilder: (_, index) => _item(widget.model.products[index])),
      floatingActionButton: ProductAddBtn(saveListener: _addProduct),
    );
  }

  _addProduct(Product p) {
    setState(() {
      widget.model.add(p);
    });
  }

  _removeProduct(Product p) {
    setState(() {
      widget.model.remove(p);
    });
  }

  Widget _item(Product p) {
    print(p.category);
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(p.category.title),
          ),
          title: Text(p.name),
          subtitle: Text(p.priceInKyat()),
          trailing: GestureDetector(
            child: Icon(Icons.delete),
            onTap: () {
              _removeProduct(p);
            },
          ),
        ),
      ),
      margin: EdgeInsets.all(4),
    );
  }
}
