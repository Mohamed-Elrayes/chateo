import 'package:auto_route/auto_route.dart';
import 'package:chateo/core/constants/api_constant.dart';
import 'package:chateo/core/constants/icon_constant.dart';
import 'package:chateo/core/router/app_router.dart';
import 'package:chateo/logic/cubit/auth/phone_auth_cubit.dart';
import 'package:chateo/presentation/pages/more_page/components/custom_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injector/inject.dart';
import '../../../../data/repositories/shared_preferences/shared_preferences_impl.dart';

class BuildHelpSectionItem extends StatelessWidget {
  const BuildHelpSectionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListWidget(
          title: 'Help',
          onTap: () {},
          iconLead: helpIcon,
        ),
        CustomListWidget(
          title: 'Invite Your Friends',
          onTap: () {},
          iconLead: messageIcon,
        ),
        CustomListWidget(
          title: 'Log out',
          onTap: () async {
            context.read<PhoneAuthCubit>().signOut();
            final instanceSharedPref = injector<SharedPreferencesImpl>();
            await instanceSharedPref.setBoolData(
                SharedKey.showVerifyScreen, true);
            context.router.pushAndPopUntil(VerificationRoute(),
                predicate: (Route<dynamic> route) => false);
          },
          iconLead: logoutIcon,
        ),
      ],
    );
  }
}
