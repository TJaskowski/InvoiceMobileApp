import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final void Function() onPressed;
  const CustomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
       hoverColor: Colors.blueAccent.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: onPressed,
          child: Icon(Icons.add),
          backgroundColor: Colors.blueAccent.shade200,
          );
  }
}