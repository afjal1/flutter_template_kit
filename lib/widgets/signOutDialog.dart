import 'package:flutter/material.dart';

class SignOutConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: 300,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.contact_support, size: 50),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('Are you sure you want to sign out?',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center),
            ),
            const Divider(height: 0, color: Colors.blue),
            Row(children: [
              Expanded(
                  child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: const Radius.circular(10))),
                  child: Text('Yes',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
              )),
              Expanded(
                  child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          bottomRight: const Radius.circular(10))),
                  child:
                      const Text('No', style: TextStyle(color: Colors.white)),
                ),
              )),
            ])
          ]),
        ));
  }
}
