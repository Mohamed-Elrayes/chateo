import 'package:auto_route/auto_route.dart';
import 'package:chateo/core/router/app_router.dart';
import 'package:chateo/core/router/routes.dart';
import 'package:chateo/presentation/screens/verification_screen/verification_screen.dart';
import 'package:chateo/presentation/widget/shared_widget/button_widget.dart';
import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: SizedBox(
                  width: 300,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SvgPicture.asset(
                          'assets/onboard_left.svg',
                          semanticsLabel: 'onboard_left',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          'assets/onboard_right.svg',
                          fit: BoxFit.cover,
                          semanticsLabel: 'onboard_right',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: CustomTextWidget.title(
                  'Connect easily with\nyour family and friends\nover countries',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  CustomTextWidget.subTitle('Terms & Privacy Policy'),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                    label: 'Start Messaging',
                      onTap: () =>context.router.push(VerificationRoute()),
                   
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
