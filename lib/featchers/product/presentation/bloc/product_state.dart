part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final ProductModel? productModel;

  ProductLoaded({this.productModel}) {
    // print("productModel :: ${productModel!.limit.toString()}");
  }

  @override
  List<Object> get props => [productModel!];
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});

  @override
  List<Object> get props => [message];
}
