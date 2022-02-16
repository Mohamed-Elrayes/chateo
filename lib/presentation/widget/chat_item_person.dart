import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class ChatItemPerson extends StatelessWidget {
  const ChatItemPerson({
    Key? key,
    required this.personName,
    this.isOnline,
  }) : super(key: key);

  final String personName;
  final bool? isOnline;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _RoundAvatarWidget(isOnline: isOnline ?? false),
      title: CustomTextWidget(personName),
      subtitle: CustomTextWidget(
        'Online',
        style:
            Theme.of(context).textTheme.headline3?.copyWith(color: Colors.grey),
      ),
    );
  }
}

class _RoundAvatarWidget extends StatelessWidget {
  const _RoundAvatarWidget({
    Key? key,
    required this.isOnline,
  }) : super(key: key);
  final bool isOnline;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        isOnline
            ? Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
