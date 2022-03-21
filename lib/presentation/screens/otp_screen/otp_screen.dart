import 'package:auto_route/auto_route.dart';
import 'package:chateo/core/constants/logger_devtool.dart';
import 'package:chateo/core/router/app_router.dart';
import 'package:chateo/core/router/routes.dart';
import 'package:chateo/logic/cubit/auth/phone_auth_cubit.dart';
import 'package:chateo/logic/cubit/profile_data/profile_data_cubit.dart';
import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:chateo/presentation/widget/shared_widget/dialog_widget.dart';
import 'package:chateo/presentation/widget/shared_widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends HookWidget {
  const OtpScreen( {Key? key,required this.phoneNumberArg,}) : super(key: key);
final String phoneNumberArg;
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
                listenWhen: (previous, current) =>
                    previous.authStatus != current.authStatus,
                listener: (_, state) {
                  if (state.authStatus == AuthStatus.login) {
                    context.router.pushAndPopUntil(BottomNavRoute(), predicate: (Route<dynamic> route)=>false);
                      
                    // Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   RouterName.bottomNavScreen,
                    //   (route) => false,
                    // );
                  } else if (state.authStatus == AuthStatus.completeSend  ) {
                    context.router.pushAndPopUntil(BottomNavRoute(), predicate: (Route<dynamic> route)=>false);

                    // Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   RouterName.profileScreen,
                    //   (route) => false,
                    // );
                  }
                  if (state.authStatus == AuthStatus.loading) {
                    showDialog<AlertDialog>(
                      context: context,
                      builder: (ctx) => const LoadingIndicator(),
                    );
                  }
                  if (state.authStatus == AuthStatus.failed) {
                    controller.clear();
                    'message'.logWtf();
                    showDialog<AlertDialog>(
                      context: context,
                      builder: (_) => DialogWidget(
                        message: state.errorMessage!,
                      ),
                    );
                  }
                },
                builder: (context, state) => PinCodeTextField(
                  length: 6,
                  controller: controller,
                  pinTheme: PinTheme(
                    inactiveFillColor: const Color(0XFFEDEDED),
                    selectedFillColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                    inactiveColor: const Color.fromARGB(255, 186, 185, 185),
                    selectedColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.4),
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
                  onCompleted: (numberValue) async {
                    final _phoneCubitProvider = context.read<PhoneAuthCubit>();
                    final _profileCubitProvider =
                        context.read<ProfileDataCubit>();
                    await _phoneCubitProvider.submitOtp(numberValue);
                    _profileCubitProvider.profileDataCached.id =
                        _phoneCubitProvider.state.userId;
                  },
                  onChanged: (value) {
                    // print(value);
                  },
                  beforeTextPaste: (text) {
                    // print("Allowing to paste $text");
                    return true;
                  },
                  appContext: context,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              TextButton(
                onPressed: () {},
                child: CustomTextWidget.customSubTitle(
                  'Resend Code',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
