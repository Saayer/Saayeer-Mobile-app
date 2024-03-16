import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/utils/constants/constants.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/bloc/shipment_details_bloc.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/widgets/details/basic_info.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/widgets/details/bill_info.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/widgets/details/promo_code.dart';
import 'package:saayer/features/shipments_sub_features/shipment_details/presentation/widgets/details/shipping_info.dart';

class ShipmentDetailsWidget extends StatelessWidget {
  const ShipmentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocConsumer<ShipmentDetailsBloc, ShipmentDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                BasicInfo(
                  shipmentDetailsEntity: state.shipmentDetailsEntity!,
                ),
                SizedBox(height: 16.h),
                ShippingInfo(
                  shipmentDetailsEntity: state.shipmentDetailsEntity!,
                ),
                SizedBox(height: 16.h),
                BillInfo(
                  shipmentDetailsEntity: state.shipmentDetailsEntity!,
                ),
                SizedBox(height: 16.h),
                const PromoCode(),
                SizedBox(height: 32.h),
                SaayerDefaultTextButton(
                  text: "pay_now",
                  isEnabled: true,
                  borderRadius: 16.r,
                  onPressed: () {},
                  btnWidth: width / 1.2,
                  btnHeight: 50.h,
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
