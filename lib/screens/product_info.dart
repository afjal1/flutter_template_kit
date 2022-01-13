import 'package:flutter/material.dart';
import 'package:template_kit/help/colors.dart';
import 'package:template_kit/model/product.dart';
import 'package:template_kit/widgets/custom_image.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel? product;

  const ProductDetails({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _size = 'regular';

    bool _showAppBar = false;

    late ScrollController _scrollController;
    final double bannerWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = MediaQuery.of(context).size.width * 3 / 4;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorLight.primary,
        ),
        centerTitle: true,
        title: Text(product!.name!, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            CustomNetworkImage(
              image: product!.images!.first,
              height: 250,
              width: bannerWidth,
            ),
            _buildInfo(product!),
            const Divider(),
            _buildSpecialInstructions(),
            _buildAddToCart(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(ProductModel productModel, {ProductDetails? product}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Flexible(
            child: Text(productModel.name!,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('MRP: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text('\$ ${productModel.price!}',
                  style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('After Offer: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text('\$ ${productModel.price! - 10}',
                  style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        _buildOptionSize(),
        Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis.',
              style: TextStyle(color: Colors.black),
            )),
        const SizedBox(height: 16)
      ],
    );
  }

  Widget _buildOptionSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: const [
                  Text('Size',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 16),
              _radioSize(
                  value: 'regular',
                  primaryText: 'Option 1',
                  secondaryText: '\$ 30'),
              const SizedBox(height: 16),
              _radioSize(
                  value: 'regular',
                  primaryText: 'Option 2',
                  secondaryText: '\$ 40'),
              const SizedBox(height: 16),
              _radioSize(
                  value: 'large',
                  primaryText: 'Option 3',
                  secondaryText: '+ \$100'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSpecialInstructions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Special Instructions',
                      style: const TextStyle(color: Colors.black)),
                  const SizedBox(width: 8),
                  const Text('Optional',
                      style: const TextStyle(color: Colors.black))
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  hintText: 'e.g. No soy sauce please',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
                ),
                style: TextStyle(color: Colors.black54, fontSize: 14),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _radioSize(
      {value = 'regular', primaryText = 'Regular', secondaryText = '0'}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Row(
        children: [
          Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Center(
                  child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: ColorLight.primary,
                        shape: BoxShape.circle,
                      )))),
          const SizedBox(width: 16),
          Text(primaryText,
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(secondaryText,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ))
        ],
      ),
    );
  }

  Widget _buildAddToCart() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: kToolbarHeight,
          color: Colors.red,
          child: const Center(
              child: Text('Add to Cart',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
