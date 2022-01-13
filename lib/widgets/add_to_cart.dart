import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_kit/widgets/product_card.dart';

class AddtoCart extends StatefulWidget {
  @override
  _AddtoCartState createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  @override
  void initState() {
    super.initState();
  }

  bool isInCart = false;

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   isInCart = cartController.cartItems.contains(widget.data) ?? false;
    // });

    return isInCart
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedIconButton(
                  icon: Icons.remove,
                  onPress: () {
                    setState(() {
                      // cartController.getQty();
                      // cartController.totalPrice1();
                    });
                  },
                  iconSize: 20),
              FittedBox(
                child: Text('2',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              RoundedIconButton(
                  icon: Icons.add,
                  onPress: () {
                    setState(() {});
                  },
                  iconSize: 20),
            ],
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {
              isInCart = !isInCart;
              Get.snackbar(
                "Item added to cart",
                "Item added",
                icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                borderRadius: 10,
                margin: EdgeInsets.all(15),
                colorText: Colors.white,
                duration: Duration(seconds: 2),
                isDismissible: true,
                //      dismissDirection: SnackDismissDirection.HORIZONTAL,
                forwardAnimationCurve: Curves.easeOutBack,
              );
              setState(() {});
            },
            child: Text(
              "Add to Cart",
              style: TextStyle(fontSize: 15),
            ),
          );
  }
}
