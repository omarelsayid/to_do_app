import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/custom_button.dart';

class DailogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCnacel;
  DailogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCnacel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        color: Colors.yellow[300],
        child: Column(
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            //svae button + cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                CustomButton(
                  onPressed: () {},
                  text: 'save',
                ),

                const SizedBox(
                  width: 4,
                ),
                //cancel button
                CustomButton(
                  onPressed: () {},
                  text: 'cancel',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
