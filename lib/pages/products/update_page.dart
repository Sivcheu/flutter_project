import 'package:flutter/material.dart';
import 'package:prefinal/controller/product_controller.dart';
import 'package:prefinal/models/product_model.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  Product product;
  UpdateProductPage({this.product});

  @override
  _UpdateProductPageState createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  var _nameCtrl = TextEditingController();
  var _priceCtrl = TextEditingController();
  var _processorCtrl = TextEditingController();
  var _ramCtrl = TextEditingController();
  var _strorageCtrl = TextEditingController();
  var _screenCtrl = TextEditingController();
  var _vgaCtrl = TextEditingController();
  var _weightCtrl = TextEditingController();
  var _colorCtrl = TextEditingController();
  var _brandCtrl = TextEditingController();
  var _imgCtrl = TextEditingController();

  var _scaffordKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _nameCtrl.text = widget.product.name;
    _priceCtrl.text = widget.product.price;
    _processorCtrl.text = widget.product.processor;
    _ramCtrl.text = widget.product.ram;
    _strorageCtrl.text = widget.product.storage;
    _screenCtrl.text = widget.product.screen;
    _vgaCtrl.text = widget.product.vga;
    _weightCtrl.text = widget.product.weight;
    _colorCtrl.text = widget.product.color;
    _brandCtrl.text = widget.product.brandName;
    _imgCtrl.text = widget.product.img;
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
      key: _scaffordKey,
      appBar: _buildAppBar,
      body: InkWell(
        child: _buildBody,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }

  get _buildAppBar {
    return AppBar(
      title: Text("UpdatePage"),
      actions: [
        IconButton(
          icon: Icon(Icons.save_alt),
          onPressed: () {
            if (_nameCtrl.text.trim().isNotEmpty &&
                _priceCtrl.text.trim().isNotEmpty &&
                _processorCtrl.text.trim().isNotEmpty &&
                _ramCtrl.text.trim().isNotEmpty &&
                _brandCtrl.text.trim().isNotEmpty &&
                _screenCtrl.text.trim().isNotEmpty &&
                _strorageCtrl.text.trim().isNotEmpty &&
                _vgaCtrl.text.trim().isNotEmpty &&
                _weightCtrl.text.trim().isNotEmpty &&
                _colorCtrl.text.trim().isNotEmpty) {
              Product product = Product(
                pId: widget.product.pId,
                name: _nameCtrl.text.trim(),
                price: _priceCtrl.text.trim(),
                processor: _processorCtrl.text.trim(),
                ram: _ramCtrl.text.trim(),
                storage: _strorageCtrl.text.trim(),
                screen: _screenCtrl.text.trim(),
                vga: _vgaCtrl.text.trim(),
                weight: _weightCtrl.text.trim(),
                color: _colorCtrl.text.trim(),
                brandName: _brandCtrl.text.trim(),
                img: _imgCtrl.text.trim(),
                date: DateTime.now(),
              );
              updateProduct(product).then((value) {
                print("$value");
                _showMsg("Data updated");
                Navigator.of(context).pop();
              });
            } else {
              _showMsg("Field are required");
            }
          },
        ),
      ],
    );
  }

  get _buildBody {
    return Container(
      // alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          width: 400,
          height: MediaQuery.of(context).size.height,
          // height: 1000,
          padding: EdgeInsets.all(20),
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNametext,
              _buildpricetext,
              _buildprocessortext,
              _buildramtext,
              _buildstoragetext,
              _buildscreentext,
              _buildvgatext,
              _buildweighttext,
              _buildcolortext,
              _buildBrandtext,
              _buildImgText,
            ],
          ),
        ),
      ),
    );
  }

  get _buildNametext {
    return TextField(
      controller: _nameCtrl,
      decoration: InputDecoration(
        hintText: "Model",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.laptop),
      ),
      autocorrect: true,
      // obscureText: true, = password fields
      textCapitalization: TextCapitalization.words,
    );
  }

  get _buildpricetext {
    return TextField(
      keyboardType: TextInputType.number,
      controller: _priceCtrl,
      decoration: InputDecoration(
        hintText: "Price",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.monetization_on),
      ),
      autocorrect: true,
      // obscureText: true, = password fields
    );
  }

  get _buildprocessortext {
    return TextField(
      controller: _processorCtrl,
      decoration: InputDecoration(
        hintText: "Processor",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.support_sharp),
      ),
      autocorrect: true,
      // obscureText: true, = password fields
      textCapitalization: TextCapitalization.words,
    );
  }

  get _buildramtext {
    return TextField(
      controller: _ramCtrl,
      decoration: InputDecoration(
        hintText: "Ram",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.memory),
      ),
      autocorrect: true,
      // obscureText: true, = password fields
      textCapitalization: TextCapitalization.words,
    );
  }

  get _buildstoragetext {
    return TextField(
      controller: _strorageCtrl,
      decoration: InputDecoration(
        hintText: "Storage",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.storage),
      ),
      autocorrect: true,
      // obscureText: true, = password fields
      textCapitalization: TextCapitalization.words,
    );
  }

  get _buildscreentext {
    return TextField(
      controller: _screenCtrl,
      decoration: InputDecoration(
          hintText: "Screen",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.laptop)),
      autocorrect: true,
      // obscureText: true, = password fields
      textCapitalization: TextCapitalization.words,
    );
  }

  get _buildvgatext {
    return TextField(
      controller: _vgaCtrl,
      decoration: InputDecoration(
        hintText: "VGA",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.memory),
      ),
      autocorrect: true,
      // obscureText: true, = password fields
      textCapitalization: TextCapitalization.words,
    );
  }

  get _buildweighttext {
    return TextField(
      controller: _weightCtrl,
      decoration: InputDecoration(
        hintText: "Weight",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.line_weight_sharp),
      ),
      autocorrect: true,
      // obscureText: true, = password fields
      textCapitalization: TextCapitalization.words,
    );
  }

  get _buildcolortext {
    return TextField(
      controller: _colorCtrl,
      decoration: InputDecoration(
        hintText: "Color",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.color_lens),
      ),
      autocorrect: true,
      // obscureText: true, = password fields
      textCapitalization: TextCapitalization.words,
    );
  }

  get _buildBrandtext {
    return TextField(
      controller: _brandCtrl,
      decoration: InputDecoration(
        hintText: "Brand",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.brightness_auto_outlined),
      ),
      autocorrect: true,
      // obscureText: true, = password fields
      textCapitalization: TextCapitalization.words,
    );
  }

  get _buildImgText {
    return TextField(
      controller: _imgCtrl,
      decoration: InputDecoration(
        hintText: "ImgUrl",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.image),
      ),
      autocorrect: true,
      // obscureText: true, = password fields
      textCapitalization: TextCapitalization.words,
    );
  }
}
