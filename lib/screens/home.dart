import 'package:flutter/material.dart';
import 'package:template_kit/help/constants.dart';
import 'package:template_kit/help/data.dart';
import 'package:template_kit/widgets/carousel.dart';
import 'package:template_kit/widgets/category_section.dart';
import 'package:template_kit/widgets/scrollable_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _carouselIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  // void setStateIfMounted(f) {
  //   if (mounted) setState(f);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('Yola', style: TextStyle(color: Colors.red, fontSize: 25)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          elevation: 3,
          actions: [
            Icon(
              Icons.search,
              color: Colors.red,
              size: 25,
            ),
            const SizedBox(
              width: 12,
            ),
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ),
            const SizedBox(
              width: 12,
            ),
            Icon(
              Icons.shopping_bag,
              color: Colors.red,
              size: 25,
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                BuildCarouselSwiper(
                  itemCount: LocalList.carouselSwiperList(),
                  carouselIndex: _carouselIndex,
                  onIndexChanged: (val) {
                    setState(() => _carouselIndex = val);
                  },
                ),
                const SizedBox(height: Const.space25),
                CategorySection(
                  itemCount: LocalList.topCategoryList(),
                ),
                const SizedBox(height: Const.space15),
                ScrollableSection(
                  label: 'New Arrival',
                  itemCount: LocalList.allProductList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
