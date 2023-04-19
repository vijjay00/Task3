import 'package:flutter/material.dart';

import '../customwidgets/customformfield.dart';
import '../customwidgets/customtextformicon.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
        onTap: () {
      Navigator.pop(context);
    },
            child: Icon(Icons.arrow_back_rounded, color: Colors.black, ),
          ),
          centerTitle: false,
          titleSpacing: 5,
          title: Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              CustomFormfield(name: 'John Doe',),
              CustomFormfield(name: 'john_doe',),
              CustomFormfield(name: 'UI/UX Designer',),
              CustomTextFormIcon(name: '12/27/1995',icons: Icon(Icons.calendar_month, color: Color(0xff3b3b3b),),),
              CustomTextFormIcon(name: 'john_doe@yourdomain.com',icons: Icon(Icons.mail_outline_rounded, color: Color(0xff3b3b3b)),),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                child: SizedBox(
                  height: 48,
                  child: TextFormField(
                    showCursor: false,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.start,
                    initialValue: "+1 111 467 378 399",
                    style: TextStyle(color: Color(0xff3b3b3b), fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xfffafafa),
                      prefixIcon: Container(
                        margin: EdgeInsets.only(left: 18),
                        width: 60,
                        child: Row(children: [
                            Image.asset("images/usa.png"),
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 2),
                              child: Icon(Icons.keyboard_arrow_down_outlined, color: Color(0xff3b3b3b),),
                            ),
                          ],),
                      ),
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
              ),
              CustomTextFormIcon(name: 'Male',icons: Icon(Icons.arrow_drop_down_outlined, color: Color(0xff3b3b3b)),),
              CustomFormfield(name: 'Website',),
              TextButton(onPressed: (){}, child: Text("Switch to Professional Account", style: TextStyle(color: Color(0xff009df8), fontWeight: FontWeight.bold),),),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                child: SizedBox(
                  width: double.infinity,
                  height: 45, child: OutlinedButton(
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xffff3563),
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(40))),
                  ),
                  onPressed: () {

                  },
                ),),
              ),
            ],
          ),
        ),
      );
  }
}