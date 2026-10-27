
import 'package:ecommerce_app_huma_volve/features/home/data/models/product_model.dart';

abstract class AbstractDataSourceDetails {
   Future< ProductModel> getProductById(int productId);
}