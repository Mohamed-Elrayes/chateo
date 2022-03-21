import 'package:auto_route/auto_route.dart';
import 'package:chateo/core/constants/logger_devtool.dart';
import 'package:chateo/core/router/app_router.dart';
import 'package:chateo/core/router/routes.dart';
import 'package:chateo/logic/cubit/image_profile/image_profile_cubit.dart';
import 'package:chateo/logic/cubit/profile_data/profile_data_cubit.dart';
import 'package:chateo/presentation/screens/profile_screen/components/build_form_fields.dart';
import 'package:chateo/presentation/screens/profile_screen/components/build_image_profile.dart';
import 'package:chateo/presentation/widget/shared_widget/button_widget.dart';
import 'package:chateo/presentation/widget/shared_widget/dialog_widget.dart';
import 'package:chateo/presentation/widget/shared_widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Profile'),
        ),
        body: _BuildProfileWidgets(),
      ),
    );
  }
}

class _BuildProfileWidgets extends StatelessWidget {
  _BuildProfileWidgets({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final _readProfileDataCubit = BlocProvider.of<ProfileDataCubit>(context);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildImageProfile(),
              const SizedBox(
                height: 40,
              ),
              BuildFormField(
                hintText: 'First Name (Required)',
                textInputAction: TextInputAction.next,
                onSaved: (String? name) {
                  _readProfileDataCubit.profileDataCached.firstName =
                      name.toString();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter FirstName!';
                  } else if (value.length < 3) {
                    return 'Too short for a Name!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              BuildFormField(
                hintText: 'Last Name (Optional)',
                textInputAction: TextInputAction.done,
                onSaved: (String? name) {
                  _readProfileDataCubit.profileDataCached.lastName =
                      name.toString();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                  } else if (value.length < 2) {
                    return 'Too short for a Name!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              BlocConsumer<ProfileDataCubit, ProfileDataState>(
                listener: (context, state) {
                  if (state.profileDataStatus == ProfileDataStatus.loading) {
                    showDialog<AlertDialog>(
                      context: context,
                      builder: (ctx) => const LoadingIndicator(),
                    );
                  }
                  if (state.profileDataStatus == ProfileDataStatus.success) {
                    context.router.pushAndPopUntil(BottomNavRoute(), predicate: (Route<dynamic> route)=>false);

                    // Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   RouterName.bottomNavScreen,
                    //   (route) => false,
                    // );
                  } else {
                    showDialog<AlertDialog>(
                      context: context,
                      builder: (ctx) =>
                          DialogWidget(message: state.errorMessage!),
                    );
                  }
                },
                builder: (context, state) {
                  switch (state.profileDataStatus) {
                    case ProfileDataStatus.unSend:
                    case ProfileDataStatus.success:
                      return ButtonWidget(
                        label: 'Save',
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                            _formKey.currentState?.validate();
                            return;
                          } else {
                            _formKey.currentState!.save();
                            final data =
                                _readProfileDataCubit.profileDataCached;
                            _readProfileDataCubit.saveProfileData();
                            data.firstName?.logWtf();
                            data.lastName?.logWtf();
                            data.phoneNumber?.logWtf();
                            data.profileImage?.logWtf();
                            data.imageUrlServer?.logWtf();
                          }
                        },
                      );
                    default:
                      return const LoadingIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
