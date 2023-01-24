import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gdn_health/core/error/failures.dart';
import 'package:gdn_health/featchers/product/domain/useCase/product_use_case.dart';
import 'package:gdn_health/featchers/product/presentation/functions/product_functions.dart';

import '../../../../core/dependencyInjection/app_dependency_injections.dart';
import '../../domain/model/product_model.dart';
import '../../domain/repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductUseCase? productUseCase;


  ProductCubit({this.productUseCase}) : super(ProductInitial());

  fetchProduct() async {
    emit(ProductLoading());
    try {
      Either<Failure, ProductModel>? products =
          await sl<ProductFunctions>().getProducts(productUseCase, emit);

      products.fold((l) {
        emit(ProductError(message: l.toString()));
      }, (r) {
        print("products : ${r.products}");
        emit(ProductLoaded(productModel: r));
      });
    } catch (e) {
      print("The error is : ${e.toString()}");
    }
  }
}
