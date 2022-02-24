import 'package:chateo/core/constants/icon_constant.dart';
import 'package:chateo/core/constants/pick_and_save_image.dart';
import 'package:chateo/logic/cubit/image_profile/image_profile_cubit.dart';
import 'package:chateo/logic/cubit/profile_data/profile_data_cubit.dart';
import 'package:chateo/presentation/screens/profile_screen/components/ink_button_widget.dart';
import 'package:chateo/presentation/widget/shared_widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildImageProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _color = Theme.of(context).colorScheme;
    return SizedBox(
      // color: Colors.red,
      width: 100,
      height: 101,
      child: Stack(
        children: [
          BlocBuilder<ImageProfileCubit, ImageProfileState>(
            builder: (context, state) {
              switch (state.imageStatus) {
                case ImageStatus.loading:
                  return const Center(child: LoadingIndicator());
                case ImageStatus.saved:
                  context
                      .read<ProfileDataCubit>()
                      .profileDataCached
                      .profileImage = state.imageFile?.path;
                  return InkButtonWidget(
                    child: Image.file(
                      state.imageFile!,
                      fit: BoxFit.fill,
                    ),
                    onTap: () =>
                        DeviceResources.openFileDevice(state.imageFile!.path),
                  );
                default:
                  return InkButtonWidget(
                    child: Icon(
                      userIcon,
                      size: 50,
                      color: _color.primary,
                    ),
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
                      context.read<ImageProfileCubit>().onTapToPicImage(),
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
