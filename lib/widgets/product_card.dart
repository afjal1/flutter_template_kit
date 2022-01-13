import 'package:flutter/material.dart';
import 'package:template_kit/help/constants.dart';
import 'package:template_kit/model/product.dart';
import 'package:template_kit/widgets/custom_text.dart';

import 'add_to_cart.dart';
import 'custom_image.dart';

class BuildProductCard extends StatelessWidget {
  final ProductModel? product;

  const BuildProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 150,
        child: Column(
          children: [
            CustomNetworkImage(image: product!.images!.first),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.name!,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyText2!.copyWith(height: 1.2),
                  ),
                  const SizedBox(height: 3),
                  CustomPriceText(value: product!.price!),
                  const SizedBox(width: 5),
                  AddtoCart()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(
      {required this.icon, required this.onPress, required this.iconSize});

  final IconData icon;
  final Function onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 6.0,
      onPressed: () {},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(iconSize * 0.2)),
      fillColor: Colors.red,
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize * 0.8,
      ),
    );
  }
}
