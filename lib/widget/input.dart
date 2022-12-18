import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const InputField({Key? key, required this.hint, this.controller, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green, width: 1.0),
            ),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  style: TextStyle(color: Colors.green),
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  cursorColor: Colors.grey[700],
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(color: Colors.green),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0))),
                )),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InputField2 extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const InputField2(
      {Key? key, required this.hint, this.controller, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green, width: 1.0),
            ),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  style: TextStyle(color: Colors.green),
                  textAlign: TextAlign.center,
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  cursorColor: Colors.grey[700],
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(color: Colors.green),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0))),
                )),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
