import 'package:flutter/material.dart';
import 'package:projectpart1/constants.dart';
import 'package:projectpart1/input_container.dart';

class RoundedPasswordInput extends StatelessWidget{
  const RoundedPasswordInput({
    Key? key,
    required this.hint

  }) : super(key:key);
  final String hint;


  @override
  Widget build(BuildContext context) {
    TextEditingController _passwordController = TextEditingController();
    // TODO: implement build
    return InputContainer(
        child: TextField(
          controller: _passwordController,
          cursorColor: kPrimaryColor,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock,color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none,

          ),

        )
    );
  }

}
