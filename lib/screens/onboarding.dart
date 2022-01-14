import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_kit/controller/onBoardController.dart';
import 'package:template_kit/help/data.dart';
import 'package:template_kit/model/onBoard.dart';
import 'package:template_kit/screens/home.dart';

final OnBoardController onBoardController = Get.put(OnBoardController());

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(() => const HomeScreen());
                },
                // ignore: prefer_const_constructors
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView.builder(
                itemCount: 3,
                controller: _pageController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: OnBoardingWidget(
                      onBoardingModel: LocalList.onBoardingList(context)[index],
                    ),
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    onBoardController.setIndex(index);
                  });
                }),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  _pageIndicators(LocalList.onBoardingList(context), context),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Stack(children: [
              Center(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Obx(
                      () => CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        value: (onBoardController.index!.obs + 1) /
                            LocalList.onBoardingList(context).length,
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Get.to(() => HomeScreen());
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Icon(
                      onBoardController.index!.obs + 1 ==
                              LocalList.onBoardingList(context).length
                          ? Icons.check
                          : Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      )),
    );
  }

  List<Widget> _pageIndicators(var onBoardingList, BuildContext context) {
    List<Container> _indicators = [];

    for (int i = 0; i < onBoardingList.length; i++) {
      _indicators.add(
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(50)),
        ),
      );
    }
    return _indicators;
  }
}

class OnBoardingWidget extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  const OnBoardingWidget({required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          flex: 7,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset(onBoardingModel.image!),
          )),
      Expanded(
        flex: 1,
        child: Text(
          onBoardingModel.title!,
          style: TextStyle(
            fontSize: 22,
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Expanded(
        flex: 2,
        child: Text(
          onBoardingModel.subtitle!,
          style: const TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      )
    ]);
  }
}
