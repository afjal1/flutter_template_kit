
import 'package:flutter/material.dart';
import 'package:template_kit/help/data.dart';
import 'package:template_kit/help/screens.dart';

class CategorySection extends StatelessWidget {
  final List itemCount;

  const CategorySection({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String label(String val) {
      switch (val) {
        case 'Dress':
          return 'Dress';
        case 'Shoes':
          return 'Shoes';
        case 'Bag':
          return 'Bags';
        case 'Other':
          return 'Others';

        default:
          return '';
      }
    }


    return Container(
      width: Screens.width(context),
      height: 90,
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: LocalList.topCategoryList()
            .map((e) => Expanded(
                  child: BuildCategoryCircleCard(
                   
                    icon: e.icon!,
                    label: label(e.label!), onTap: () {  },
                  ),
                ))
            .toList(),
      ),
    );
  }
}





class BuildCategoryCircleCard extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String label;

  const BuildCategoryCircleCard(
      {Key? key, required this.onTap, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:   BorderRadius.circular(15),
      child: SizedBox(
        width: 75,
        child: Column(
          children: [
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                width: 50,
                height: 50,
                padding: const  EdgeInsets.all(10),
                child: Center(child: Image.asset(icon)),
              ),
            ),
           const   SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
