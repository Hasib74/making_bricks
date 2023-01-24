import 'package:dartz/dartz.dart';
import 'package:gdn_health/core/error/failures.dart';
import 'package:gdn_health/core/network/app_network.dart';
import 'package:gdn_health/core/remoteHelper/app_urls.dart';
import 'package:gdn_health/core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:gdn_health/core/remoteHelper/responseHelper/model/model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/dependencyInjection/app_dependency_injections.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failure, AppApiResponse>> getProducte();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  @override
  Future<Either<Failure, AppApiResponse<Model>>> getProducte() async {
    print(
        "Is connectedwith internet : ${await sl<AppNetworkInfo>().isConnected}");


    if (await sl<AppNetworkInfo>().isConnected) {
      http.Response _res = await http.get(Uri.parse(AppUri.products));

      print("Current _response :: ${_res.body}");

      return Right(AppApiResponse.data(
        response: _res,
      ));
    } else {
      return Left(NoInternetConnection());
    }
  }
}
