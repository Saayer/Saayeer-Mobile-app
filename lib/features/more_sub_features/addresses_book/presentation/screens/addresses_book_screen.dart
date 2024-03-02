import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/core/services/injection/injection.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/pages/addresses_book_page.dart';

class AddressesBookScreen extends StatelessWidget {
  const AddressesBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final AddressesBookBloc bloc = getIt<AddressesBookBloc>();
        bloc.add(const GetAddresses());
        return bloc;
      },
      child: const AddressesBookPage(),
    );
  }
}
