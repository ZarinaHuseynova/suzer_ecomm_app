import 'package:suzer_ecom_appp/global/constants/app_assets.dart';
import '../models/product_models.dart';

class ProductData {
  static List<ProductModel>get generateProducts {
    return [
      ProductModel(
        1,
        AppAssets.mixedShoes,
        "FS - Nike Air Max 270 React",
        299.43,
        534.33,
        '24 % Off'
      ),
      ProductModel(
        2,
        AppAssets.blueShoes,
        "FS - Nike Air Max 270 React",
        299.43,
        534.33,
        '24 % Off'
      ),
       ProductModel(
        3,
        AppAssets.redShoes,
        "FS - Nike Air Max 270 React",
        299.43,
        534.33,
        '24 % Off'
      ),
       ProductModel(
        4,
        AppAssets.blackBag,
        "FS - Nike Air Max 270 React",
        299.43,
        534.33,
        '24 % Off'
      ),
       ProductModel(
        5,
        AppAssets.pinkBag,
        "FS - Nike Air Max 270 React",
        299.43,
        534.33,
        '24 % Off'
      ),
        ProductModel(
        5,
        AppAssets.redBag,
        "FS - Nike Air Max 270 React",
        299.43,
        534.33,
        '24 % Off'
      ),
    ];
  }
}
