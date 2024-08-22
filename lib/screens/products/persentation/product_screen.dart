import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
   @override
  void initState() {
     ProductBloc  productBloc = BlocProvider.of<ProductBloc>(context ,listen: false);
     // ProductBloc  productBloc2 = context.read<ProductBloc>();

     // ProductBloc  productBloc1 = BlocProvider.of<ProductBloc>(context );
     // ProductBloc  productBloc3 = context.watch<ProductBloc>();
     productBloc.add(GetProductEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 

      Scaffold(
        appBar:  AppBar(
          title:  Text("Products list"),
          centerTitle: true,
        ),
        // BlocBuilder  build ui only once
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (BuildContext context, ProductState state) {
             if( state is  ProductLoadingState ){

                 return Center(
                   child:  CircularProgressIndicator(),
                 );
             } else if( state is ProductLoadedState ){
                return ListView.builder(
                  itemCount:  state.listProduct.length,
                    itemBuilder: (BuildContext cont , int index){
                   return Container(
                     height: 150,
                     width: double.infinity,
                     margin: EdgeInsets.only(bottom: 10 ,left: 10 ,right: 10) ,
                     padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                     decoration: BoxDecoration(
                       color: Colors.green.withOpacity(.05),
                           borderRadius: BorderRadius.circular(12)
                     ),
                   );
                });

             } else if ( state is ProductEmptyState){}
             else if(state is ProductErrorLoadingState){

             }
              return Container();
          },),

      )
    
    ;
  }
}
