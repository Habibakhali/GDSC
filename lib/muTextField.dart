import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  TextEditingController controller = TextEditingController();
var fn;
  bool obscure = false;
  String label;

  Icon prefix;
  Widget? suffix;
  TextInputType keyboard;
  MyTextFeild(this.controller,this.fn, this.obscure, this.label, this.prefix,this.keyboard,
      {this.suffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
          controller: controller,
          keyboardType:keyboard ,
          validator: fn,
          obscureText: this.obscure,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: prefix,
            suffixIcon: suffix,
          )),
    );
  }
}
