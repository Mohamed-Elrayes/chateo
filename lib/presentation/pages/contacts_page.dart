import '../widget/shared_widget/search_field_widget.dart';
import 'package:flutter/material.dart';

import '../widget/shared_widget/chat_item_person.dart';
import '../widget/shared_widget/custom_text_widget.dart';
import '../widget/widget_animate/animated_list_chats_widget.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget('Contacts'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Column(
        children: [
          const SearchFieldWidget(),
          Expanded(
            child: ListChatsWidget(
              itemCount: 6,
              childBuilderAnimated: (context, index) => const ChatItemPerson(
                  personName: 'Athalia Putri', isOnline: true),
            ),
          )
        ],
      ),
    );
  }
}
