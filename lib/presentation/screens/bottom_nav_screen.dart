import 'package:flutter/material.dart';
import '../../core/constants/iteration_const.dart';
import '../widget/widget_animate/fade_transition_pages_widget.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({Key? key}) : super(key: key);
  final ValueNotifier<int> _value = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: _value,
        builder: (context, _, child) {
          return Scaffold(
            body: FadeThroughTransitionWidget(
              child: bottomNavPages.keys.elementAt(_value.value),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _value.value,
              onTap: (int i) {
                _value.value = i;
              },
              items: bottomNavItems,
            ),
          );
        });
  }
}
