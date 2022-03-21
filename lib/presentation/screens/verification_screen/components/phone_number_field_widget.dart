import 'package:chateo/data/models/card_formatter.dart';
import 'package:flutter/material.dart';

class PhoneNumberFieldWidget extends StatelessWidget {
  const PhoneNumberFieldWidget({
    required this.onSaveField,
    this.onChanged,
    Key? key,
  }) : super(key: key);
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onSaveField;
  @override
  Widget build(BuildContext context) {
    // final _bgColor = Theme.of(context).colorScheme.onTertiary;
    return TextFormField(
      autofocus: true,
      cursorColor: Colors.black,
      onSaved: onSaveField,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.phone,
      style: const TextStyle(
        fontSize: 18,
        letterSpacing: 2.0,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        // fillColor: _bgColor,
        // focusColor: _bgColor,
        filled: true,
        constraints: const BoxConstraints(maxHeight: 50),
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
      inputFormatters: [CardFormatter(sample: 'xxxx-xxxx-xxx', separator: '-')],
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your phone number!';
        } else if (value.length < 11) {
          return 'Too short for a phone number!';
        }
        return null;
      },
    );
  }
}
