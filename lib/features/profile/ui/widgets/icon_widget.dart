import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
   final IconData  icon;
   final Color color;
   const IconWidget({
     super.key,
    required this.icon,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(icon,color: Colors.white,size: 20,),
      ),
    );
  }
}
