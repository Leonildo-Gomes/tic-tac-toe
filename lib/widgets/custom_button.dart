import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   final String text;
   final IconData icon;
   final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.icon,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        fixedSize: Size(200, 50),
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed, 
      label: Text(text),
      icon: Icon(icon),
      );
  }
}