import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, this.onTap, required this.label, this.widget})
      : super(key: key);
  final VoidCallback? onTap;
  final String label;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
        // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        //     const EdgeInsets.symmetric(horizontal: double.maxFinite)),
      ),
      onPressed: onTap,
      child: widget ??
          CustomTextWidget(
            label,
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: Theme.of(context).colorScheme.background),
          ),
    );
  }
}
