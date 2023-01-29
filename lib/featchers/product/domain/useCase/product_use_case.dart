import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gdn_health/core/error/failures.dart';
import 'package:gdn_health/core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:gdn_health/core/remoteHelper/responseHelper/model/model.dart';
import 'package:gdn_health/core/useCase/useCase.dart';

import '../repository/product_repository.dart';

class ProductUseCase extends UseCase<AppApiResponse, ProductParams> {
  ProductRepository? producteRepository;

  ProductUseCase({required this.producteRepository});

  @override
  Future<Either<Failure, AppApiResponse<Model>>> call(
      ProductParams params) async {
    if (params is GetProductParms) {
      print("GetProductParms");
      return producteRepository!.getProducts();
    } else {
      return Left(UnImplement());
    }
  }
}

class ProductParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetProductParms extends ProductParams {
  GetProductParms() {
    print("GetProductParms");
  }
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
