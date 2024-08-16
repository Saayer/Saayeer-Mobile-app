import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saayer/common/buttons/saayer_default_text_button.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipments_cariers_selection/presentation/bloc/carriers_shipment_bloc.dart';

class CarriersShipmentPage extends StatelessWidget {
  const CarriersShipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return BlocConsumer<CarriersShipmentBloc, CarriersShipmentState>(
      listener: (context, state) async {},
      builder: (context, state) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: SaayerTheme().getColorsPalette.backgroundColor,
          bottomSheet: Container(
            width: width,
            color: SaayerTheme().getColorsPalette.backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 50.h, left: 16.w, right: 16.w, top: 20.h),
              child: SaayerDefaultTextButton(
                text: "next",
                isEnabled: true,
                //enablePersonalInfo(personalInfoBloc),
                borderRadius: 16.r,
                onPressed: () {
                  // final bool isFormValid =
                  // (personalInfoBloc.formKey.currentState!.validate());
                  // personalInfoBloc.add(ToggleAutoValidate());
                  // isFormValid
                  //     ? personalInfoBloc.add(SubmitPersonalInfoData())
                  //     : SaayerToast()
                  //     .showErrorToast(msg: "empty_fields_error".tr());
                },
                btnWidth: width / 1.2,
                btnHeight: 50.h,
              ),
            ),
          ),
          body: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: SaayerTheme().getColorsPalette.backgroundColor,
              child: const SingleChildScrollView(
                child: Center(
                    child: Column(
                  children: [Center(child: Text('CarriersShipmentPage'))],
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
