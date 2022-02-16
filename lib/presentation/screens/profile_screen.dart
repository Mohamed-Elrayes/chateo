import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:chateo/presentation/widget/button_widget.dart';

import '../../core/constants/icon_constant.dart';
import '../../core/constants/method_const.dart';
import '../../logic/cubit/image_profile_data/image_profile_data_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageProfileDataCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Profile'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _BuildImageProfile(),
                const SizedBox(
                  height: 40,
                ),
                const _BuildFormField(
                    hintText: 'First Name (Required)',
                    textInputAction: TextInputAction.next),
                const SizedBox(
                  height: 10,
                ),
                const _BuildFormField(
                    hintText: 'Last Name (Optional)',
                    textInputAction: TextInputAction.done),
                const SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                  label: 'Save',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildFormField extends StatelessWidget {
  const _BuildFormField({
    Key? key,
    required this.hintText,
    required this.textInputAction,
  }) : super(key: key);
  final String hintText;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    final _bgColor = Theme.of(context).colorScheme.onTertiary;

    return TextFormField(
      cursorColor: Colors.black,
      textInputAction: textInputAction,
      keyboardType: TextInputType.name,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: _bgColor,
        focusColor: _bgColor,
        filled: true,
        // constraints: const BoxConstraints(minHeight: ),
        // errorBorder: InputBorder.none,

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'Please enter yout phone number!';
      //   } else if (value.length < 11) {
      //     return 'Too short for a phone number!';
      //   }
      //   return null;
      // },
    );
  }
}

class _BuildImageProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _color = Theme.of(context).colorScheme;
    return SizedBox(
      // color: Colors.red,
      width: 100,
      height: 101,
      child: Stack(
        children: [
          BlocBuilder<ImageProfileDataCubit, ImageProfileDataState>(
            builder: (context, state) {
              switch (state.imageStatus) {
                case ImageStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case ImageStatus.found:
                  return InkBuuWidget(
                    child: Image.file(
                      state.imageFile!,
                      fit: BoxFit.fill,
                    ),
                    onTap: () => openFileDevice(state.imageFile!.path),
                  );
                default:
                  return InkBuuWidget(
                    child: Icon(
                      userIcon,
                      size: 50,
                      color: _color.primary,
                    ),
                    onTap: () {},
                  );
              }
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ClipOval(
              child: Material(
                color: _color.primary,
                child: InkWell(
                  splashColor: Theme.of(context).colorScheme.secondary,
                  onTap: () =>
                      context.read<ImageProfileDataCubit>().onTapToPicImage(),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.add,
                      color: _color.background,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InkBuuWidget extends StatelessWidget {
  const InkBuuWidget({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final _color = Theme.of(context).colorScheme;
    return ClipOval(
      child: Material(
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.secondary,
          onTap: onTap,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: _color.onTertiary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
