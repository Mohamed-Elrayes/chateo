import 'package:chateo/core/constants/method_const.dart';
import 'package:flutter/material.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // decoration: BoxDecoration(
      //   // color: Theme.of(context).colorScheme.onTertiary,
      //   // border: Border.all(color: Colors.red),
      //   borderRadius: const BorderRadius.all(Radius.circular(6)),
      // ),
      child: Center(
        child: Text(
          '${countryFlagGenerate()} +20',
          style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
        ),
      ),
    );
  }
}
