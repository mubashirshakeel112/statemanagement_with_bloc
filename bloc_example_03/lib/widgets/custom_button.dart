
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final Widget? child;
  final double? height;

  const PrimaryButton({super.key, required this.onPressed, this.title, this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: height ?? 70,
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide.none),
      elevation: 0,
      onPressed: onPressed,
      child: child ?? Text(title ?? '', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}