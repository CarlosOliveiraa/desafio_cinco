import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {


  final void Function()? onTap;
  final TextEditingController? controller;


  const CustomTextFormField({ Key? key, this.onTap, this.controller }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:  InputDecoration(
        labelText: "Digite sua cidade",
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: const Icon(Icons.search)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          
        )
      ),
    );
  }
}