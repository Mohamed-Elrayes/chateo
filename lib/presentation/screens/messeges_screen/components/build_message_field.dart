import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildMessageField extends StatelessWidget {
  BuildMessageField({
    Key? key,
    required this.controller,
    required this.isEmojiVisible,
    required this.isKeyboardVisible,
    required this.onBlurred,
    // required this.onSentMessage,
    required this.onChanged,
  }) : super(key: key);
  final TextEditingController controller;
  final bool isEmojiVisible;
  final bool isKeyboardVisible;
  final VoidCallback onBlurred;
  // final ValueChanged<String> onSentMessage;
  final ValueChanged<String> onChanged;

  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 1,
      child: Row(
        children: <Widget>[
           _EmojiWidget(
             isEmojiVisible: isEmojiVisible,
             onClickedEmoji:_onClickedEmoji,
           ),
          Expanded(
            child: TextField(
              controller: controller,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration.collapsed(
                hintText: 'Write a message',
              ),
              onChanged: onChanged,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.photo_camera,
              color: Color(0xff00897B),
              size: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Future<void> _onClickedEmoji() async {
     if (isEmojiVisible) {
      focusNode.requestFocus();
    } else if (isKeyboardVisible) {
      // await SystemChannels.textInput.invokeMethod('TextInput.hide');
      // await Future.delayed(const Duration(milliseconds: 100));
    }
    onBlurred();
  }

}

class _EmojiWidget extends StatelessWidget {
  const _EmojiWidget({
    Key? key,
    required this.isEmojiVisible,
    required this.onClickedEmoji,
  }) : super(key: key);
  final bool isEmojiVisible;
  final VoidCallback onClickedEmoji;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isEmojiVisible ? Icons.keyboard_rounded : Icons.emoji_emotions_outlined,
        size: 25,
      ),
      onPressed: onClickedEmoji,
    );
  }
}
