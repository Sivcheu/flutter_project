import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:prefinal/controller/product_controller.dart';
import 'package:prefinal/models/product_model.dart';
import 'package:prefinal/pages/products/detail_page.dart';
import 'package:prefinal/pages/products/update_page.dart';

import 'insert_page.dart';
// import 'package:prefinal/pages/products/insert_page.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> _productList;
  Future _productData;

  @override
  void initState() {
    super.initState();
    _productData = readProduct();
  }

  _showMsg(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      title: Text("Products"),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => InsertProductPage(),
              ),
            )
                .then(
              (value) {
                setState(() {
                  _productData = readProduct();
                });
              },
            );
          },
        ),
      ],
    );
  }

  get _buildBody {
    return Container(
      color: Colors.blueGrey,
      child: _buildFutureReader,
    );
  }

  get _buildFutureReader {
    return FutureBuilder<ProductModel>(
      future: _productData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Error While loading: ${snapshot.error}");
          return Text("${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          _productList = snapshot.data.products;
          return _buildListView;
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  get _buildListView {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _productData = readProduct();
        });
      },
      child: ListView.builder(
        itemCount: _productList.length,
        itemBuilder: (context, index) {
          return _buildItem(_productList[index]);
        },
      ),
    );
  }

  _buildItem(Product product) {
    return Card(
      child: Container(
        child: Slidable(
          actionExtentRatio: 0.25, //Default
          actionPane: SlidableDrawerActionPane(),
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              color: Colors.red,
              caption: "Delete",
              onTap: () {
                deleteProduct(product).then(
                  (value) {
                    print("Value: $value");
                    if (value == "deleted") {
                      _showMsg("Data deleted");
                      setState(() {
                        _productList.remove(product);
                      });
                    } else {
                      _showMsg("Something went wrong");
                    }
                  },
                );
              },
            ),
            IconSlideAction(
              icon: Icons.edit,
              color: Colors.blue,
              caption: "Edit",
              onTap: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => UpdateProductPage(product: product),
                  ),
                )
                    .then(
                  (value) {
                    setState(() {
                      _productData = readProduct();
                    });
                  },
                );
              },
            )
          ],
          child: ListTile(
            leading: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "${product.pId}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            title: Text(
              "${product.name}",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "Price: ${product.price} \$",
              style: TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailProductPage(product: product,),
                    ),
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
