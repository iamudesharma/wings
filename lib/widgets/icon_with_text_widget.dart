import 'package:flutter/material.dart';

class IconWithTextWidget extends StatelessWidget {
  const IconWithTextWidget({
    Key? key,
    required this.onTap,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  final VoidCallback onTap;

  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData),
          SizedBox(
            height: 5,
          ),
          Text(title),
        ],
      ),
    );
  }
}
