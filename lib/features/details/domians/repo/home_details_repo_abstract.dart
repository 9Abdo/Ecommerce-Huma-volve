import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../home/domain/entity/product_entity.dart';

abstract class HomeDetailsRepoAbstract {
  Future<Either<FailureApp, ProductEntity>> getProductById(int productId);
}
