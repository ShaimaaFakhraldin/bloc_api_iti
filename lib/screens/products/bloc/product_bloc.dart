import 'package:bloc_api_iti/screens/products/bloc/product_event.dart';
import 'package:bloc_api_iti/screens/products/bloc/product_state.dart';
import 'package:bloc_api_iti/screens/products/data/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/reprository/product_reprository.dart';

class ProductBloc  extends Bloc<ProductEvent ,ProductState>{
  ProductRepository  productRepository  ;
   ProductBloc ({required this.productRepository}) :super (ProductInitial()){
     on<GetProductEvent>((GetProductEvent event ,Emitter<ProductState>  emit) async{
       emit(ProductLoadingState());

       try{
         List<Product> listProduct = await  productRepository.getProduct();
         if(listProduct.isEmpty){
           emit(ProductEmptyState());
         }else{
           emit(ProductLoadedState(listProduct:listProduct ));
         }

       } catch(e){
          emit(ProductErrorLoadingState(errorMassage: "some thing error"));
       }


     });

   }
}