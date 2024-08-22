import 'dart:convert';

import 'package:http/http.dart';

import '../../../../data/network_provider.dart';
import '../product_model.dart';

class ProductRepository{
  
  Future<List<Product>> getProduct() async {
     Response response =  await NetworkProvider.getRequest("https://dummyjson.com/products");
     if(response.statusCode == 200){
       ProductsModel  productsModel = ProductsModel.fromJson(jsonDecode(response.body));
         return productsModel.products ;
     }else {

        throw "Error loading products" ;
     }
  }
}