import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/user_products_screen.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit-product-screen";

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageEditingController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _product =
      Product(id: null, description: "", imageUrl: "", price: 0, title: "");

  var _isInit = true;
  var _initValues = {
    'title': "",
    'description': "",
    'price': "",
    'imageUrl': ""
  };

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final pid = ModalRoute.of(context).settings.arguments as String;
      if (pid != null) {
        _product = Provider.of<Products>(context, listen: false).findById(pid);
        _initValues = {
          'title': _product.title,
          'description': _product.description,
          'price': _product.price.toString(),
          'imageUrl': ""
        };
        _imageEditingController.text = _product.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _descriptionFocusNode.dispose();
    _priceFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageEditingController.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }

    _form.currentState.save();
    if (_product.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_product.id, _product);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(_product);
    }
    Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: "Title"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) =>
                    {FocusScope.of(context).requestFocus(_priceFocusNode)},
                onSaved: (newValue) {
                  _product = Product(
                    title: newValue,
                    id: _product.id,
                    isfav: _product.isfav,
                    price: _product.price,
                    imageUrl: _product.imageUrl,
                    description: _product.description,
                  );
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
              ),
              TextFormField(
                  initialValue: _initValues['description'],
                  decoration: InputDecoration(
                    labelText: "Price",
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (value) => {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode)
                      },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter a price";
                    }
                    if (double.parse(value) <= 0.0) {
                      return "Enter a valid price";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _product = Product(
                        title: _product.title,
                        id: _product.id,
                        isfav: _product.isfav,
                        price: double.parse(newValue),
                        imageUrl: _product.imageUrl,
                        description: _product.description);
                  }),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: "Description"),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (newValue) {
                  _product = Product(
                      title: _product.title,
                      id: _product.id,
                      isfav: _product.isfav,
                      price: _product.price,
                      imageUrl: _product.imageUrl,
                      description: newValue);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter a description";
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: _imageEditingController.text.isEmpty
                        ? Icon(
                            Icons.image,
                            color: Colors.grey,
                          )
                        : Container(
                            child: Image.network(
                              _imageEditingController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Image URL",
                      ),
                      controller: _imageEditingController,
                      focusNode: _imageUrlFocusNode,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _saveForm,
                      onSaved: (newValue) {
                        _product = Product(
                            title: _product.title,
                            id: _product.id,
                            isfav: _product.isfav,
                            price: _product.price,
                            imageUrl: newValue,
                            description: _product.description);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter image source";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: _saveForm,
                color: Colors.blue,
                child: Container(
                    child: Text(
                  "Add Product",
                  style: TextStyle(color: Colors.white),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
