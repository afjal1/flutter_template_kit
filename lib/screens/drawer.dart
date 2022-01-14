import 'package:flutter/material.dart';
import 'package:template_kit/help/constants.dart';
import 'package:template_kit/widgets/customDrawer.dart';
import 'package:template_kit/widgets/signOutDialog.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final CustomDrawerController _drawerController = CustomDrawerController();

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      menuScreen: MenuWidget(drawerController: _drawerController),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final CustomDrawerController drawerController;

  MenuWidget({required this.drawerController});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (drawerController.isOpen()) {
          drawerController.toggle();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                    width: 1170,
                    child: Column(children: [
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              onTap: () {},
                              leading: ClipOval(
                                child: Image.asset(Images.arrived,
                                    height: 50, width: 50, fit: BoxFit.cover),
                              ),
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Hey Afjal',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Welcome to Yola',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.green),
                                    ),
                                  ]),
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.red,
                            child: Image.asset(Images.automotive,
                                height: 50, width: 50, fit: BoxFit.cover),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(height: 50),
                      MenuButton(
                          drawerController: drawerController,
                          index: 0,
                          icon: Images.done,
                          title: 'Home'),
                      const Divider(
                        thickness: 1,
                      ),
                      MenuButton(
                          drawerController: drawerController,
                          index: 1,
                          icon: Images.done,
                          title: 'All Categories'),
                      const Divider(
                        thickness: 1,
                      ),
                      MenuButton(
                          drawerController: drawerController,
                          index: 2,
                          icon: Images.dress,
                          title: 'Cart'),
                      const Divider(
                        thickness: 1,
                      ),
                      MenuButton(
                          drawerController: drawerController,
                          index: 3,
                          icon: Images.creditCard,
                          title: 'My Order'),
                      const Divider(
                        thickness: 1,
                      ),
                      MenuButton(
                          drawerController: drawerController,
                          index: 4,
                          icon: Images.computer,
                          title: 'Address'),
                      const Divider(
                        thickness: 1,
                      ),
                      MenuButton(
                          drawerController: drawerController,
                          index: 5,
                          icon: Images.dress,
                          title: 'Coupouns'),
                      const Divider(
                        thickness: 1,
                      ),
                      MenuButton(
                          drawerController: drawerController,
                          index: 6,
                          icon: Images.done,
                          title: 'Live Chat'),
                      const Divider(
                        thickness: 1,
                      ),
                      MenuButton(
                          drawerController: drawerController,
                          index: 7,
                          icon: Images.shoes,
                          title: 'Settings'),
                      const Divider(
                        thickness: 1,
                      ),
                      MenuButton(
                        drawerController: drawerController,
                        index: 8,
                        icon: Images.travelling,
                        title: 'Terms & Conditions',
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      MenuButton(
                          drawerController: drawerController,
                          index: 9,
                          icon: Images.paypal,
                          title: 'Privacy Policy'),
                      const Divider(
                        thickness: 1,
                      ),
                      MenuButton(
                          drawerController: drawerController,
                          index: 10,
                          icon: Images.done,
                          title: 'About Us'),
                      const Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) =>
                                  SignOutConfirmationDialog());
                        },
                        leading: const Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                        title: const Text('Logout',
                            style: TextStyle(fontSize: 18, color: Colors.red)),
                      ),
                    ])),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final CustomDrawerController drawerController;
  final int index;
  final String icon;
  final String title;
  MenuButton(
      {required this.drawerController,
      required this.index,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        drawerController.toggle();
      },
      selectedTileColor: Colors.black.withAlpha(30),
      leading: Image.asset(
        icon,
        color: Colors.red,
        width: 25,
        height: 25,
      ),
      title: Text(title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.red,
          )),
    );
  }
}
