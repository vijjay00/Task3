import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  FollowButton({Key? key, required this.value, required this.onTap})
      : super(key: key);
  bool value;
  Function() onTap;
  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.value) {
    return SizedBox(
      height: 30,
      child: OutlinedButton(
        child: Text(
          "Following",
          style: TextStyle(color: Color(0xffff3563), fontSize: 12),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(20),),
          ),
          side: BorderSide(width: 1.5, color: Color(0xffff3563)),
        ),
        onPressed: () {
          widget.onTap();
        },
      ),
    );
    } else {
     return SizedBox(height: 30, child: OutlinedButton(
        child: Text(
          "Follow",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0xffff3563),
          shape: const RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(20))),
        ),
        onPressed: () {
          widget.onTap();
        },
      ),);
    }
  }
}