import 'package:chateo/data/models/user_model.dart';
import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ChatItemPerson extends StatelessWidget {
  const ChatItemPerson({
    Key? key,
    required this.userModel,
    this.isOnline,
    this.onTap,
  }) : super(key: key);

  final UserModel userModel;
  final bool? isOnline;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: _RoundAvatarWidget(
        isOnline: isOnline ?? false,
        image: userModel.imageUrlServer!,
      ),
      title: CustomTextWidget(userModel.firstName!),
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
    required this.image,
  }) : super(key: key);
  final bool isOnline;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(image, fit: BoxFit.cover),
          ),
        ),
        if (isOnline)
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white, width: 2.0),
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}
