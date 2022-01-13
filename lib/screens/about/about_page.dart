import 'package:flutter/material.dart';
import 'package:template_kit/widgets/custom_appBar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBarAtt(
        context,
        title: 'About us',
      ),
      body: ListView(
        children: [
          // Image.asset(
          //   'assets/images/other/4.jpg',
          //   fit: BoxFit.fitWidth,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About us', style: _theme.textTheme.headline2),
                const SizedBox(height: 15),
                Text(
                  'This is a free flutter template new updates will be added soon.',
                  style: _theme.textTheme.bodyText2,
                ),
                const SizedBox(height: 15),

//                 SizedBox(
//                   width: 150,
//                   height: 50,
//                   child: RaisedButton(
// //                        title: 'Learn More',
//                     onPressed: () {
//                       Get.to(WebViewExample());
//                     },
//                     child: Text('Learn more', style: _theme.textTheme.button),
//                   ),
//                 ),
                const SizedBox(height: 25),
                Text('Our purpose', style: _theme.textTheme.headline2),
                Container(
                  width: 46,
                  height: 10,
                  color: _theme.primaryColor,
                ),
                const SizedBox(height: 15),
                Text(
                  'This is a free flutter template new updates will be added soon.',
                  style: _theme.textTheme.subtitle1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
