import 'package:chateo/core/constants/icon_constant.dart';
import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomListWidget extends StatelessWidget {
  const CustomListWidget({
    Key? key,
    this.iconLead,
    required this.onTap,
    required this.title,
    this.widgetLead,
  }) : super(key: key);
  final IconData? iconLead;
  final Widget? widgetLead;

  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 5,
      leading: widgetLead ?? Icon(iconLead),
      onTap: onTap,
      title: CustomTextWidget.subTitleBold(title),
      trailing: const Icon(forwardArrowIcon),
    );
  }
}
