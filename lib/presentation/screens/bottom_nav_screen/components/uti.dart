import 'package:chateo/core/constants/icon_constant.dart';
import 'package:chateo/data/models/bottom_nav_items._model.dart';
import 'package:chateo/presentation/pages/chats_page/chats_page.dart';
import 'package:chateo/presentation/pages/contacts_page.dart';
import 'package:chateo/presentation/pages/more_page/more_page.dart';
import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:flutter/cupertino.dart';

final Map<Widget, IconSelectItem> bottomNavPages = {
  const ContactsPage(): IconSelectItem(label: 'Contacts', icon: usersIcon),
  const ChatsPage(): IconSelectItem(label: 'Chats', icon: chatHeadIcon),
  const MorePage(): IconSelectItem(label: 'More', icon: moreIcon),
};

List<BottomNavigationBarItem> get bottomNavItems => [
      ...bottomNavPages.values
          .map(
            (e) => BottomNavigationBarItem(
              activeIcon: Column(
                children: [
                  CustomTextWidget(e.label!),
                  Container(
                    width: 10,
                    height: 10,
                    alignment: Alignment.bottomCenter,
                    // margin: const EdgeInsets.only(top: 2),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffc32c37),
                      ),
                    ),
                  ),
                ],
              ),
              label: e.label,
              icon: Icon(e.icon),
            ),
          )
          .toList()
    ];
