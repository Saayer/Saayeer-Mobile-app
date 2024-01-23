import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

///AppBarWidget
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onTapLeading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final bool? hasLeading;

  const AppBarWidget(
      {Key? key,
      required this.title,
      this.onTapLeading,
      this.actions,
      this.centerTitle = false,
      this.hasLeading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: centerTitle,
      titleSpacing: 0,
      elevation: 2,
      title: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 18,
          color: SaayerTheme().getColorsPalette().blackTextColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
      ),
      actions: actions ?? [],
      leadingWidth: !(hasLeading!) ? 20 : null,
      leading: hasLeading!
          ? GestureDetector(
              onTap: onTapLeading ??
                  () {
                    FocusScope.of(context).unfocus();
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Navigator.pop(context);
                    });
                  },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: SaayerTheme().getColorsPalette().blackTextColor,
              ),
            )
          : SizedBox(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}

/// PageViewAppBarWidget
class PageViewAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leadingWidget;

  const PageViewAppBarWidget(
      {Key? key, this.title, this.actions, this.leadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: SaayerTheme().getColorsPalette().whiteColor,
      centerTitle: false,
      titleSpacing: 0,
      elevation: 2,
      leading: leadingWidget ?? Placeholder(color: SaayerTheme().getColorsPalette().whiteColor),
      leadingWidth: leadingWidget != null ? 50 : 20,
      title: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Text(
          title!,
          style: GoogleFonts.roboto(
            fontSize: 18,
            color: SaayerTheme().getColorsPalette().orangeColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
