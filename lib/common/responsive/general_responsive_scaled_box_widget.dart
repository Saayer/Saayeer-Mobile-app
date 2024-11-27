import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

///wrap with all screens to allow responsive scaled box
class GeneralResponsiveScaledBoxWidget extends StatelessWidget {
  final Widget child;

  const GeneralResponsiveScaledBoxWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaledBox(
      width: ResponsiveValue<double>(context, conditionalValues: const [
        Condition.between(start: 0, end: 450, value: 450),
        Condition.between(start: 450, end: 800, value: 600),
        //Condition.between(start: 800, end: 1100, value: 1000),
        Condition.between(start: 800, end: 1400, value: 1000),
        Condition.between(start: 1400, end: 9999, value: 1500),
      ]).value,
      child: child,
    );
  }
}
