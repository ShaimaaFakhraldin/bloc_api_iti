import 'package:bloc_api_iti/screens/products/data/product_model.dart';

abstract class ProductState {}
class ProductInitial extends ProductState{}
class ProductLoadingState  extends ProductState {}
class ProductLoadedState extends ProductState{
  List<Product> listProduct ;
  ProductLoadedState({ required this.listProduct});
} 
class ProductEmptyState extends ProductState {}
class ProductErrorLoadingState extends ProductState{

   String errorMassage ;
   ProductErrorLoadingState({ required this.errorMassage});
}
