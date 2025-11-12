import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final String? title;

  const CustomLoader({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 25, height: 25, child: CircularProgressIndicator(color: Colors.white)),
          if(title != null)
            ...[
              SizedBox(width: 15),
              Text(
                title!,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ]
        ],
      ),
    );
  }
}