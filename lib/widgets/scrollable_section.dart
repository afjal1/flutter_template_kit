import 'package:flutter/material.dart';
import 'package:template_kit/help/constants.dart';
import 'package:template_kit/help/screens.dart';
import 'package:template_kit/model/product.dart';
import 'package:template_kit/widgets/product_card.dart';

import 'label_section.dart';

class ScrollableSection extends StatelessWidget {
  final List<ProductModel> itemCount;
  final String label;

  const ScrollableSection({
    Key? key,
    required this.itemCount,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildLabelSection(
          label: label,
          onViewAllTap: () {},
        ),
        const SizedBox(height: Const.space15),
        Container(
          width: Screens.width(context),
          height: 300,
          margin: const EdgeInsets.only(bottom: 15),
          child: ListView.builder(
            itemCount: itemCount.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            itemBuilder: (context, index) {
              final data = itemCount[index];
              return BuildProductCard(
                product: data,
              );
            },
          ),
        ),
      ],
    );
  }
}
