import 'package:chateo/core/constants/router_name.dart';
import 'package:chateo/data/models/card_formatter.dart';
import 'package:chateo/presentation/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/api_constant.dart';
import '../../core/constants/method_const.dart';
import '../../logic/cubit/auth/phone_auth_cubit.dart';
import '../widget/button_widget.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  late final String _phoneNumber;

  Future<void> _register(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      // Navigator.pop(context);
      _phoneFormKey.currentState?.validate();
      return;
    } else {
      // Navigator.pop(context);10
      _phoneFormKey.currentState!.save();
      logger.e(_phoneNumber);
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(_phoneNumber);
      Navigator.pushNamed(context, RouterName.otpScreen,
          arguments: _phoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _phoneFormKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomTextWidget.title('Enter Your Phone Number'),
                      const SizedBox(height: 10),
                      CustomTextWidget.subTitle(
                          'Please confirm your country code and enter\nyour phone number'),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: _FlagWidget(),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          flex: 2,
                          child: PhoneNumberField(
                              onSaveField: (value) =>
                                  _phoneNumber = value!.replaceAll('-', ''))),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
                    builder: (context, state) {
                      switch (state.authStatus) {
                        case AuthStatus.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          return ButtonWidget(
                            label: 'continue',
                            onTap: () async {
                              await _register(context);
                            },
                          );
                      }
                    },
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class _FlagWidget extends StatelessWidget {
  const _FlagWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        // border: Border.all(color: Colors.red),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Center(
        child: Text(
          countryFlagGenerate() + ' +20',
          style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
        ),
      ),
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    required this.onSaveField,
    Key? key,
  }) : super(key: key);

  final ValueChanged<String?>? onSaveField;
  @override
  Widget build(BuildContext context) {
    final _bgColor = Theme.of(context).colorScheme.onPrimary;
    return TextFormField(
      autofocus: true,
      cursorColor: Colors.black,
      onSaved: onSaveField,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.phone,
      style: const TextStyle(
        fontSize: 18,
        letterSpacing: 2.0,
      ),
      decoration: InputDecoration(
          fillColor: _bgColor,
          focusColor: _bgColor,
          filled: true,
          constraints: const BoxConstraints(maxHeight: 50),
          // errorBorder: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          )),
      inputFormatters: [CardFormatter(sample: 'xxxx-xxxx-xxx', separator: '-')],
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter yout phone number!';
        } else if (value.length < 11) {
          return 'Too short for a phone number!';
        }
        return null;
      },
    );
  }
}
