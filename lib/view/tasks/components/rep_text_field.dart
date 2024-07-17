
import 'package:flutter/material.dart';
import 'package:todoapplication/utils/app_str.dart';

class RepTextField extends StatelessWidget {
  const RepTextField({
    super.key,
    required this.controller, this.isForDesc = false,required this.onFieldSubmitted,required this.onChanged,
  });

  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool isForDesc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDesc ? 6 : null,
          cursorHeight: !isForDesc ? 60 : null,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: isForDesc ? AppStr.addNote : null,
            prefixIcon: isForDesc ? Icon(Icons.bookmark_border,color: Colors.grey,) : null,
            border: isForDesc ? InputBorder.none : null,
            counter: Container(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
        
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
