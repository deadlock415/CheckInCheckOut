import 'dart:io';

//import 'package:adminecom/db/users.dart';
import 'package:checkinout/db/users.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../db/product.dart';
import 'package:provider/provider.dart';
//import '../providers/products_provider.dart';
import '../db/category.dart';


class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  CategoryService _categoryService = CategoryService();
  UserServices _userService = UserServices();
  ProductService productService = ProductService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController  sellerNameController = TextEditingController();
  TextEditingController  addressNameController = TextEditingController();
 
  
  final priceController = TextEditingController();
  // final contactController = TextEditingController();
  
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  // List<String> selectedSizes = <String>[];
  // List<String> colors = <String>[];
  bool onSale = false;
  bool featured = false;

  File _image1;
  bool isLoading = false;

  // @override
  // void initState() {
  //   _getCategories();
    
  // }

  // List<DropdownMenuItem<String>> getCategoriesDropdown() {
  //   List<DropdownMenuItem<String>> items = new List();
  //   for (int i = 0; i < categories.length; i++) {
  //     setState(() {
  //       items.insert(
  //           0,
  //           DropdownMenuItem(
  //               child: Text(categories[i].data['category']),
  //               value: categories[i].data['category']));
  //     });
  //   }
  //   return items;
  // }

  // List<DropdownMenuItem<String>> getBrandosDropDown() {
  //   List<DropdownMenuItem<String>> items = new List();
  //   for (int i = 0; i < brands.length; i++) {
  //     setState(() {
  //       items.insert(
  //           0,
  //           DropdownMenuItem(
  //               child: Text(brands[i].data['brand']),
  //               value: brands[i].data['brand']));
  //     });
  //   }
  //   return items;
  // }

  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: white,
        leading: Icon(
          Icons.close,
          color: black,
        ),
        title: Text(
          "add product",
          style: TextStyle(color: black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: isLoading
              ? CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              child: OutlineButton(
                                  borderSide: BorderSide(
                                      color: grey.withOpacity(0.5), width: 2.5),
                                  onPressed: () {
                                    _selectImage(
                                        ImagePicker.pickImage(
                                            source: ImageSource.gallery),
                                        );
                                  },
                                  child: _displayChild1()),
                            ),
                          ),
                        ),

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'enter a product name with 10 characters at maximum',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: red, fontSize: 12),
                      ),
                    ),

                  

           

                    




                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: productNameController,
                        decoration: InputDecoration(hintText: 'Product name'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the product name';
                          } else if (value.length > 10) {
                            return 'Product name cant have more than 10 letters';
                          }
                        },
                      ),
                    ),
                    //  Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: TextFormField(
                    //     controller: sellerNameController,
                    //     decoration: InputDecoration(hintText: 'Seller name'),
                    //     validator: (value) {
                    //       if (value.isEmpty) {
                    //         return 'You must enter the product name';
                    //       } 
                    //     },
                    //   ),
                    // ),
                    //  Padding(
                    //   padding: const EdgeInsets.all(12.0),
                    //   child: TextFormField(
                    //     controller: addressNameController,
                    //     decoration: InputDecoration(hintText: 'Address'),
                    //     validator: (value) {
                    //       if (value.isEmpty) {
                    //         return 'You must enter the Address name';
                    //       } 
                    //     },
                    //   ),
                    // ),
                    

//              select category
                    // Row(
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Text(
                    //         'Category: ',
                    //         style: TextStyle(color: red),
                    //       ),
                    //     ),
                    //     DropdownButton(
                    //       items: categoriesDropDown,
                    //       onChanged: changeSelectedCategory,
                    //       value: _currentCategory,
                    //     ),
                        
                        
                    //   ],
                    // ),

//
                   

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Price',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the product name';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: contactController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'phone no',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the phone no';
                          }else if (value.length > 11) {
                            return 'contact cant have more than 10 letters';
                          }
                        },
                      ),
                    ),





                    FlatButton(
                      color: red,
                      textColor: white,
                      child: Text('add product'),
                      onPressed: () {
                        validateAndUpload();
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }

  // _getCategories() async {
  //   List<DocumentSnapshot> data = await _categoryService.getCategories();
  //   print(data.length);
  //   setState(() {
  //     categories = data;
  //     categoriesDropDown = getCategoriesDropdown();
  //     _currentCategory = categories[0].data['category'];
  //   });
  // }

 

  // changeSelectedCategory(String selectedCategory) {
  //   setState(() => _currentCategory = selectedCategory);
  // }

 


  void _selectImage(Future<File> pickImage) async {
    File tempImg = await pickImage;
    setState(() => _image1 = tempImg);
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }



  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if (_image1 != null) {
        
          String imageUrl1;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 =
              "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 =
              storage.ref().child(picture1).putFile(_image1);

          StorageTaskSnapshot snapshot1 =
              await task1.onComplete.then((snapshot) => snapshot);


          task1.onComplete.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();

            productService.uploadProduct({
              "name":productNameController.text,
              "price":double.parse(priceController.text),
             "picture":imageUrl1,
             "contact":contactController.text  });
            //   "address":addressNameController.text,
            //  "seller": sellerNameController
              
          
            _formKey.currentState.reset();
            setState(() => isLoading = false);
            Navigator.pop(context);
          });
        } else {
          setState(() => isLoading = false);
        }
      } else {
        setState(() => isLoading = false);

//        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }

