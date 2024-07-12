import 'package:flutter/material.dart';
import 'package:todoapplication/utils/app_colors.dart';

GestureDetector Fab() {
  return GestureDetector(
    onTap: () {},
    child: Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 20,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
