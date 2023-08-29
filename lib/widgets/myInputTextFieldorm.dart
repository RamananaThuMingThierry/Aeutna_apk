import 'package:flutter/material.dart';

class MyInputTextFieldForm extends StatelessWidget {

  final String value;
  final String name;
  final Function onChanged;
  final Function validator;
  final IconData iconData;
  final TextInputType textInputType;

  const MyInputTextFieldForm({Key? key, required this.name, required this.onChanged, required this.validator, required this.iconData, required this.textInputType, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      style: TextStyle(color: Colors.blueGrey),
      initialValue: value,
      decoration: InputDecoration(
        hintText: name,
        prefixIcon: Icon(iconData),
        hintStyle: TextStyle(color: Colors.blueGrey),
        prefixIconColor: Colors.teal,
        enabledBorder : UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
      ),
      keyboardType: textInputType,
      onChanged: onChanged(),
      validator: validator(),
    );
  }
}