import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final String message;
  const DialogWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CustomTextWidget("Error"),
      content: CustomTextWidget(message),
      actions: [
        TextButton(
          child: const CustomTextWidget("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
