import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../widget/chat_item_person.dart';
import '../widget/custom_text_widget.dart';
import '../widget/widget_animate/animated_list_chats_widget.dart';
import '../widget/search_field_widget.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget('Chats'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline_sharp)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          )
        ],
      ),
      body: AnimationLimiter(
        child: Column(
          children: [
            const SearchFieldWidget(),
            Expanded(
              child: ListChatsWidget(
                itemCount: 6,
                childBuilderAnimated: (context, index) => const ChatItemPerson(
                  personName: 'Athalia Putri',
                  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
