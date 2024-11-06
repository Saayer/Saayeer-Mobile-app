import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saayer/common/loading/loading_widget.dart';
import 'package:saayer/features/home/core/utils/enums/enums.dart';
import 'package:saayer/features/home/presentation/bloc/home_bloc.dart';
import 'package:saayer/features/home/presentation/widgets/error_stack_widget.dart';
import 'package:saayer/features/home/presentation/widgets/generic_data_bar_chart_widget.dart';

class PaidAmountsChartSection extends StatelessWidget {
  final HomeBloc homeBloc;

  const PaidAmountsChartSection({super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool hasError = false;
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previousState, nextState) => (previousState.paidAmountsChartStateHelper.requestState !=
          nextState.paidAmountsChartStateHelper.requestState),
      listener: (context, state) {
        isLoading = (state.paidAmountsChartStateHelper.requestState == HomeRequestState.LOADING_PAID_COUNT_PER_DAY);
        if (!isLoading) {
          if (state.paidAmountsChartStateHelper.requestState == HomeRequestState.LOADED_PAID_COUNT_PER_DAY) {}
          if (state.paidAmountsChartStateHelper.requestState == HomeRequestState.SUCCESS_PAID_COUNT_PER_DAY) {}
          if (state.paidAmountsChartStateHelper.requestState == HomeRequestState.ERROR_PAID_COUNT_PER_DAY) {
            hasError = true;
          }
        }
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: (isLoading ||
                      hasError ||
                      homeBloc.amountPerDateResponse == null ||
                      homeBloc.amountPerDateResponse!.amounts!.isEmpty)
                  ? 0.5
                  : 1,
              child: GenericDataBarChartWidget(
                title: "payments_chart_title".tr(),
                yAxisTitle: 'sr'.tr(),
                total: '${homeBloc.amountsPerDaysList.total} ${'sr'.tr()}',
                dataList: homeBloc.amountsPerDaysList.amounts!.toList(),
                xAxisDataTitles: paymentsXAxisData,
                showHorizontalLine: true,
              ),
            ),
            (isLoading || homeBloc.amountPerDateResponse == null)
                ? const SaayerLoader()
                : hasError
                    ? ErrorStackWidget(
                        message: 'error_msg'.tr(),
                      )
                    : homeBloc.amountPerDateResponse!.amounts!.isEmpty
                        ? ErrorStackWidget(
                            message: 'chart_empty_msg'.tr(),
                          )
                        : Container()
          ],
        );
      },
    );
  }

  List<String> get paymentsXAxisData {
    final List<String> requiredList = [];

    for (int i = 1; i < (homeBloc.amountsPerDaysList.amounts!.length + 1); i++) {
      if (i == 1 || i == 5 || i == 10 || i == 15 || i == 20 || i == 25 || i == 30) {
        requiredList.add('$i');
      } else {
        requiredList.add('');
      }
    }

    return requiredList;
  }
}
