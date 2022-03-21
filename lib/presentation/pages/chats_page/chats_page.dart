import 'package:auto_route/auto_route.dart';
import 'package:chateo/core/router/app_router.dart';
import 'package:chateo/logic/cubit/users_profile/users_profile_cubit.dart';
import 'package:chateo/presentation/widget/shared_widget/chat_item_person.dart';
import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:chateo/presentation/widget/widget_animate/animated_list_chats_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersProfileCubit()..getAllProfile(),
      child: Scaffold(
        appBar: AppBar(
          title: const CustomTextWidget('Chats'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline_sharp),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            )
          ],
        ),
        body: const _BuildBodyChats(),
      ),
    );
  }
}

class _BuildBodyChats extends StatelessWidget {
  const _BuildBodyChats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        children: [
          // const SearchFieldWidget(),
          Expanded(
            child: BlocBuilder<UsersProfileCubit, ProfileState>(
              builder: (context, state) {
                return ListChatsWidget(
                  itemCount: state.usersProfile.length,
                  childBuilderAnimated: (context, index) => ChatItemPerson(
                    onTap: () {
                      context.router.push(MessagesItemRoute());
                    },
                    userModel: state.usersProfile[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
