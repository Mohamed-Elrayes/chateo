import 'package:chateo/core/constants/icon_constant.dart';
import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget('More'),
      ),
      body: AnimationLimiter(
        child: ListView(
          children: AnimationConfiguration.toStaggeredList(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                const _SectionWidget(
                  child: _InfoSectionItem(),
                ),
                const _SectionWidget(
                  child: _ChatSectionItem(),
                ),
                const _SectionWidget(
                  child: _SettingSectionItem(),
                ),
                const _SectionWidget(
                  child: _HelpSectionItem(),
                ),
              ],
            ).toList(),
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              verticalOffset: 10.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoSectionItem extends StatelessWidget {
  const _InfoSectionItem({Key? key}) : super(key: key);

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

class _ChatSectionItem extends StatelessWidget {
  const _ChatSectionItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomListItem(title: 'Account', onTap: () {}, iconLead: userIcon),
        _CustomListItem(title: 'Account', onTap: () {}, iconLead: chatIcon),
      ],
    );
  }
}

class _SettingSectionItem extends StatelessWidget {
  const _SettingSectionItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomListItem(title: 'Appearance', onTap: () {}, iconLead: sunIcon),
        _CustomListItem(
          title: 'Notification',
          onTap: () {},
          iconLead: notificationIcon,
        ),
        _CustomListItem(title: 'Privacy', onTap: () {}, iconLead: privacyIcon),
        _CustomListItem(
          title: 'Data Usage',
          onTap: () {},
          iconLead: folderIcon,
        ),
      ],
    );
  }
}

class _HelpSectionItem extends StatelessWidget {
  const _HelpSectionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomListItem(title: 'Help', onTap: () {}, iconLead: helpIcon),
        _CustomListItem(
          title: 'Invite Your Friends',
          onTap: () {},
          iconLead: messageIcon,
        ),
      ],
    );
  }
}

class _SectionWidget extends StatelessWidget {
  const _SectionWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: child,
    );
  }
}

class _CustomListItem extends StatelessWidget {
  const _CustomListItem({
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
