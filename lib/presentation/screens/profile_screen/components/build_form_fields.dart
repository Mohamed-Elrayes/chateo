import 'package:flutter/material.dart';

class BuildFormField extends StatelessWidget {
  const BuildFormField({
    Key? key,
    required this.hintText,
    required this.textInputAction,
    this.onSaved,
    this.validator,
  }) : super(key: key);
  final String hintText;
  final TextInputAction textInputAction;
  final ValueChanged<String?>? onSaved;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final _bgColor = Theme.of(context).colorScheme.onTertiary;

    return TextFormField(
      cursorColor: Colors.black,
      textInputAction: textInputAction,
      keyboardType: TextInputType.name,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: _bgColor,
        focusColor: _bgColor,
        filled: true,
        // constraints: const BoxConstraints(minHeight: ),
        // errorBorder: InputBorder.none,

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
      onSaved: onSaved,
      validator: validator,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Please enter yout phone number!';
      //   } else if (value.length < 11) {
      //     return 'Too short for a phone number!';
      //   }
      //   return null;
      // },
    );
  }
}
