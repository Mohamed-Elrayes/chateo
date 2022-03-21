import 'package:auto_route/auto_route.dart';
import 'package:chateo/core/router/app_router.dart';
import 'package:chateo/core/router/routes.dart';
import 'package:chateo/logic/cubit/auth/phone_auth_cubit.dart';
import 'package:chateo/logic/cubit/profile_data/profile_data_cubit.dart';
import 'package:chateo/presentation/screens/verification_screen/components/flags_widget.dart';
import 'package:chateo/presentation/screens/verification_screen/components/phone_number_field_widget.dart';
import 'package:chateo/presentation/widget/shared_widget/button_widget.dart';
import 'package:chateo/presentation/widget/shared_widget/custom_text_widget.dart';
import 'package:chateo/presentation/widget/shared_widget/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BuildBody(),
    );
  }
}

class _BuildBody extends StatelessWidget {
  _BuildBody({Key? key}) : super(key: key);
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  Future<void> _register(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      _phoneFormKey.currentState?.validate();
    } else {
      _phoneFormKey.currentState!.save();
      final _phoneData = BlocProvider.of<PhoneAuthCubit>(context);
      final _profileData = BlocProvider.of<ProfileDataCubit>(context);
      await _phoneData.sendOtp();
      _profileData.profileDataCached.phoneNumber = _phoneData.phoneNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    final phoneData = context.read<PhoneAuthCubit>();
    return SingleChildScrollView(
      child: Form(
        key: _phoneFormKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CustomTextWidget.title('Enter Your Phone Number'),
                  const SizedBox(height: 10),
                  CustomTextWidget.subTitle(
                    'Please confirm your country code and enter\nyour phone number',
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                children: [
                  const Expanded(
                    child: FlagWidget(),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 2,
                    child: PhoneNumberFieldWidget(
                      onChanged: (value) {
                        if (value?.length == 13) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      },
                      onSaveField: (value) =>
                          phoneData.phoneNumber = value!.replaceAll('-', ''),
                    ),
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
                  //TODO:heeeeeeeeer
                  if (state.authStatus == AuthStatus.completeSend) {
                    context.router.push(OtpRoute(phoneNumberArg: phoneData.phoneNumber));
                  }
                  if (state.authStatus == AuthStatus.failed) {
                    showDialog<AlertDialog>(
                      context: context,
                      builder: (_) => DialogWidget(
                        message: state.errorMessage!,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  switch (state.authStatus) {
                    case AuthStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return ButtonWidget(
                        label: 'continue',
                        onTap: () {
                          _register(context);
                        },
                      );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
