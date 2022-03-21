import 'package:chateo/core/constants/icon_constant.dart';
import 'package:chateo/presentation/pages/more_page/components/custom_list_widget.dart';
import 'package:flutter/material.dart';

class BuildChatSectionItem extends StatelessWidget {
  const BuildChatSectionItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListWidget(title: 'Account', onTap: () {}, iconLead: userIcon),
        CustomListWidget(title: 'Account', onTap: () {}, iconLead: chatIcon),
      ],
    );
  }
}
