import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

bool largerThanTablet(BuildContext context) => ResponsiveBreakpoints.of(context).largerThan(TABLET);

bool largerThanMobile(BuildContext context) => ResponsiveBreakpoints.of(context).largerThan(MOBILE);

bool equalToMobile(BuildContext context) => ResponsiveBreakpoints.of(context).isMobile;

bool equalToTablet(BuildContext context) => ResponsiveBreakpoints.of(context).isTablet;

double screenHeight(BuildContext context) => ResponsiveBreakpoints.of(context).screenHeight;

double screenWidth(BuildContext context) => ResponsiveBreakpoints.of(context).screenWidth;

double halfScreenWidth(BuildContext context) => ResponsiveBreakpoints.of(context).screenWidth / 2;
