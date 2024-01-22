import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/utils/colors.dart';
import 'package:saayer/features/intro/presentation/bloc/intro_bloc.dart';

class BulletPointsWidget extends StatelessWidget {
  const BulletPointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return BlocConsumer<IntroBloc, IntroState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final bloc = BlocProvider.of<IntroBloc>(context);
        return SizedBox(
            height: height / 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0, 1, 2]
                  .map((e) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          bloc.add(ChangeCurrentPage(currentPage: e));
                        },
                        child: e != state.currentPage
                            ? const CircleAvatar(
                                radius: 6,
                                backgroundColor: ColorsPalette.greyColor,
                              )
                            : Container(
                                width: 30,
                                height: 12,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  color: ColorsPalette.orangeColor,
                                ),
                              ),
                      )))
                  .toList(),
            ));
      },
    );
  }
}
