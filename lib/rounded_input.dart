import 'package:flutter/material.dart';
import 'package:projectpart1/constants.dart';
import 'package:projectpart1/input_container.dart';

class RoundedInput extends StatelessWidget{
  const RoundedInput({
    Key? key,

    required this.icon,
    required this.hint,
    // required this.child,
    // required this.size,
  }) : super(key:key) ;

  final IconData icon;
  final String hint;
  // final Widget child;
  // final Size size;

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();

    return InputContainer(



        child: TextField(
          controller: _emailController,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            icon: Icon(icon,color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none,

          ),

      )
    );
  }

}

