import 'package:flutter/material.dart';
import 'package:prefinal/models/product_model.dart';

class DetailProductPage extends StatefulWidget {
  final Product product;
  DetailProductPage({this.product});
  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: _buildBody,
    );
  }

  get _buildBody {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.product.img),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Price : ${widget.product.price} \$",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Processor : ${widget.product.processor}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Ram : ${widget.product.ram}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Storage : ${widget.product.storage} ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Screen : ${widget.product.screen} ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "VGA : ${widget.product.vga} ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Weight : ${widget.product.weight} Kg",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Color : ${widget.product.color}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "BrandName : ${widget.product.brandName} ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Insert Date : ${widget.product.date} ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
