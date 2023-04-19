import 'package:flutter/material.dart';

class CustomFormfield extends StatefulWidget {
  CustomFormfield({Key? key, required this.name})
      : super(key: key);
  String name;
  @override
  State<CustomFormfield> createState() => _CustomFormfieldState();
}

class _CustomFormfieldState extends State<CustomFormfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      child: SizedBox(
        height: 48,
        child: TextFormField(
          showCursor: false,
          cursorColor: Colors.black,
          textAlign: TextAlign.start,
          initialValue: widget.name,
          style: TextStyle(color: Color(0xff3b3b3b), fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xfffafafa),
            contentPadding:
            EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {}
          },
        ),
      ),
    );
  }
}