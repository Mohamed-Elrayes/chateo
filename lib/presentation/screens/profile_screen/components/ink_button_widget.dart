import 'package:flutter/material.dart';

class InkButtonWidget extends StatelessWidget {
  const InkButtonWidget({
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
