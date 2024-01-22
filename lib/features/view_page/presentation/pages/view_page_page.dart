import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return Text("");
      },
    );
  }
}
