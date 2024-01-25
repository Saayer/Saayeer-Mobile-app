import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/view_page/presentation/bloc/view_page_bloc.dart';

class ViewPagePage extends StatelessWidget {
  const ViewPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewPageBloc, ViewPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: SizedBox(
                height: 70.h,
                width: 70.w,
                child: FittedBox(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    backgroundColor: SaayerTheme().getColorsPalette.primaryColor,
                    elevation: 5,
                    onPressed: () {},
                    child: const Icon(Icons.home_filled),
                  ),
                )),
            bottomNavigationBar: BottomAppBar(
              elevation: 5,
              color: SaayerTheme().getColorsPalette.lightGreyColor,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.money),
                  ),
                  SizedBox(width: 50.w,),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.currency_bitcoin),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bar_chart),
                  ),
                ],
              ),
            ),
            body: Text(""));
      },
    );
  }
}
