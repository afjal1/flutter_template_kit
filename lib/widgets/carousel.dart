import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:template_kit/help/constants.dart';

class BuildCarouselSwiper extends StatelessWidget {
  const BuildCarouselSwiper({
    Key? key,
    required this.onIndexChanged,
    required this.carouselIndex,
    required this.itemCount,
  }) : super(key: key);

  final ValueChanged<int> onIndexChanged;
  final int carouselIndex;
  final List<String> itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Stack(
        children: [
          Swiper(
            itemCount: itemCount.length,
            onIndexChanged: onIndexChanged,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      itemCount[index],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: Const.margin,
            bottom: Const.margin,
            child: CustomDotsIndicator(
              dotsCount: itemCount,
              position: carouselIndex,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDotsIndicator extends StatelessWidget {
  final List? dotsCount;
  final int? position;

  const CustomDotsIndicator({Key? key, this.dotsCount, this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount!.length,
      position: position!.toDouble(),
      decorator: DotsDecorator(
        activeColor: Colors.red,
        activeSize: const Size(25, 9),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
