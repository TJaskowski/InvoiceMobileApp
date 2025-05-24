import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {

  final void Function() onPressed;
  const CustomAddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
       hoverColor: Colors.blueAccent.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: onPressed,
          backgroundColor: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent.shade200, 
                  Color.fromARGB(255, 159, 212, 255), 
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(child: Icon(Icons.add))),

          );
  }
}