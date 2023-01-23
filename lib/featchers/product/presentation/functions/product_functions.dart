import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:gdn_health/core/error/failures.dart';
import 'package:gdn_health/core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:gdn_health/featchers/product/domain/useCase/product_use_case.dart';
import 'package:gdn_health/featchers/product/presentation/bloc/product_cubit.dart';

import '../../domain/model/product_model.dart';

class ProductFunctions {
  ProductModel? productModel;

  Future<Either<Failure, ProductModel>> getProducts(
      ProductUseCase? productUseCase, void Function(ProductState state) emit) async {

    print("getProducts");

    emit(ProductLoading());
    return productUseCase!.call(GetProductParms()).then((value) {
      if (value.isRight()) {
        AppApiResponse? _data = value.getOrElse(() => AppApiResponse());
        ProductModel _productModel =
            ProductModel.fromJson(jsonDecode(_data.body!));
        //emit(ProductLoaded(productModel: _productModel));

        productModel = _productModel;
        return Right(_productModel);
      } else {
        //emit(ProductError(message: value.fold((l) => l.toString(), (r) => "")));
        return Left(value.fold((l) => l, (r) => UnImplement()));
      }
    });
  }
}
