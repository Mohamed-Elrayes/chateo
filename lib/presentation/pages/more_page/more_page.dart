import 'package:chateo/presentation/pages/more_page/components/build_chat_section_item.dart';
import 'package:chateo/presentation/pages/more_page/components/build_help_section_item.dart';
import 'package:chateo/presentation/pages/more_page/components/build_info_section_item.dart';
import 'package:chateo/presentation/pages/more_page/components/build_setting_section_item.dart';
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
                  child: BuildInfoSectionItem(),
                ),
                const _SectionWidget(
                  child: BuildChatSectionItem(),
                ),
                const _SectionWidget(
                  child: BuildSettingSectionItem(),
                ),
                const _SectionWidget(
                  child: BuildHelpSectionItem(),
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

