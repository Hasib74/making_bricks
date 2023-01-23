import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/remoteHelper/responseHelper/app_api_response.dart';

abstract class ProductRepository {
  Future<Either<Failure, AppApiResponse>> getProducts();
}
