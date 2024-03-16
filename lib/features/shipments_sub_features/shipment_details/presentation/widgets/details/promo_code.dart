import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saayer/common/dashed_line_vertical_painter.dart';
import 'package:saayer/common/text_fields/input_text_field.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/domain/entities/shipment_details_entity.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/bloc/shipment_details_bloc.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    final ShipmentDetailsBloc shipmentDetailsBloc =
        BlocProvider.of<ShipmentDetailsBloc>(context);
    return BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final bool isEnglish = Localization.isEnglish();
        final Radius borderRadius = Radius.circular(16.r);
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
            decoration: BoxDecoration(
              color: SaayerTheme().getColorsPalette.backgroundColor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color:
                      SaayerTheme().getColorsPalette.greyColor.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 50.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: SaayerTheme().getColorsPalette.orangeColor,
                    borderRadius: BorderRadius.only(
                      topLeft: isEnglish ? borderRadius : Radius.zero,
                      topRight: !isEnglish ? borderRadius : Radius.zero,
                      bottomLeft: isEnglish ? borderRadius : Radius.zero,
                      bottomRight: !isEnglish ? borderRadius : Radius.zero,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: SaayerTheme()
                            .getColorsPalette
                            .greyColor
                            .withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    "apply".tr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.paragraph(
                        SaayerTheme().getColorsPalette.backgroundColor),
                  ),
                ),
                Expanded(
                  child: InputTextField(
                    showOnlyTextField: true,
                    label: "promo_code".tr(),
                    inputController: shipmentDetailsBloc.promoCodeController,
                    fillColor: Colors.transparent,
                    enabledBorderColor: Colors.transparent,
                    focusedBorderColor: Colors.transparent,
                    borderRadius: 0,
                    onChanged: (val) {
                      // personalInfoBloc.add(OnTextChange(
                      //     str: val,
                      //     personalInfoFieldsType: personalInfoFieldsType,
                      //     textEditingController: _getInputController(
                      //         personalInfoBloc, personalInfoFieldsType)));
                    },
                  ),
                )
              ],
            ));
      },
    );
  }
}
