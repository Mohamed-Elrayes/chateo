
import 'package:chateo/core/constants/icon_constant.dart';
import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class BuildInfoSectionItem extends StatelessWidget {
  const BuildInfoSectionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      subtitle: const CustomTextWidget('+62 1309 - 1710 - 1920'),
      title: const CustomTextWidget('Almayra Zamzamy'),
      trailing: const Icon(forwardArrowIcon),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey[200],
        child: IconButton(
          onPressed: () {},
          icon: const Icon(userIcon),
        ),
      ),
    );
  }
}
