import 'package:flutter/material.dart';

InkWell navbarIcon({
  required VoidCallback onTap,
  required IconData icon,
  required String label,
  required Color color,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Icon(
          icon,
          size: 25,
          color: color,
        ),
        Text(
          label,
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    ),
  );
}
