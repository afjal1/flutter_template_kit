import 'package:template_kit/model/product.dart';

class FavoriteModel {
  final int? id;
  final ProductModel? product;
  bool isLiked;

  FavoriteModel({this.id, this.product, this.isLiked = false});
}
