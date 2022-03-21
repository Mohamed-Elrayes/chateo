import 'package:chateo/core/constants/icon_constant.dart';
import 'package:chateo/presentation/pages/more_page/components/custom_list_widget.dart';
import 'package:flutter/widgets.dart';

class BuildSettingSectionItem extends StatelessWidget {
  const BuildSettingSectionItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListWidget(title: 'Appearance', onTap: () {}, iconLead: sunIcon),
        CustomListWidget(
          title: 'Notification',
          onTap: () {},
          iconLead: notificationIcon,
        ),
        CustomListWidget(title: 'Privacy', onTap: () {}, iconLead: privacyIcon),
        CustomListWidget(
          title: 'Data Usage',
          onTap: () {},
          iconLead: folderIcon,
        ),
      ],
    );
  }
}
