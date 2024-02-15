import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/common/empty/empty_status_widget.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/addresses_book/presentation/bloc/addresses_book_bloc.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';

class EmptyAddressesBook extends StatelessWidget {
  const EmptyAddressesBook({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AddressesBookBloc, AddressesBookState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        const double size = 65;
        return EmptyStatusWidget(
          title: "empty_addresses_book_title".tr(),
          desc: "empty_addresses_book_desc".tr(),
          btnLabel: "add_address",
          iconName: "addresses_book",
          onBtnPressed: () {},
          size: size,
        );
      },
    );
  }
}
