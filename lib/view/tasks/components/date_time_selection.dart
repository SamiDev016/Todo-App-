
import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.onTap,
    required this.title, required this.time,
  });

  final VoidCallback onTap;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(title, style: textTheme.headlineSmall),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 80,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100),
              child: Center(
                child: Text(
                  time,
                  style: textTheme.titleSmall,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
