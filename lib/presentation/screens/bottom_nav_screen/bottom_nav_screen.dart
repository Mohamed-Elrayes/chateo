import 'package:chateo/presentation/screens/bottom_nav_screen/components/uti.dart';
import 'package:chateo/presentation/widget/widget_animate/fade_transition_pages_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomNavScreen extends HookWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final val = useState(0);
    return Scaffold(
      body: FadeThroughTransitionWidget(
        child: bottomNavPages.keys.elementAt(val.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: val.value,
        onTap: (int i) {
          val.value = i;
        },
        items: bottomNavItems,
      ),
    );
  }
}
