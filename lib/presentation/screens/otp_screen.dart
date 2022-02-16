import 'package:chateo/core/constants/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../logic/cubit/auth/phone_auth_cubit.dart';
import '../widget/custom_text_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneNumberArg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  CustomTextWidget.title('Enter Code'),
                  const SizedBox(height: 10),
                  CustomTextWidget.subTitle(
                    'We have sent you an SMS with the code\nto +2-0$phoneNumberArg',
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.slide,
                pinTheme: PinTheme(
                  inactiveFillColor: const Color(0XFFEDEDED),
                  selectedFillColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  inactiveColor: const Color.fromARGB(255, 186, 185, 185),
                  selectedColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  activeFillColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,

                enableActiveFill: true,
                keyboardType: TextInputType.number,
                cursorColor: Colors.transparent,
                // errorAnimationController: errorController,
                // controller: textEditingController,
                onCompleted: (numberValue) {
                  context.read<PhoneAuthCubit>().submitOtp(numberValue);
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouterName.homePage, (route) => false);
                },
                onChanged: (value) {
                  print(value);
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
                appContext: context,
              ),
              // BlocBuilder<TimerCubit, TimerState>(
              //   builder: (context, state) {
              //     // final _data = context
              //     //     .read<TimerCubit>()
              //     //     .startTimer(120, const Duration(seconds: 2));
              //     return CustomTextWidget.customSubTitle('$state');
              //   },
              // ),
              const SizedBox(
                height: 45,
              ),
              TextButton(
                  onPressed: () {},
                  child: CustomTextWidget.customSubTitle(
                    'Resend Code',
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
