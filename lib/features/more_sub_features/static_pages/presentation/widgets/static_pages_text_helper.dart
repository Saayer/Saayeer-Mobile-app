import 'package:flutter/material.dart';
import 'package:saayer/core/services/localization/localization.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';
import 'package:saayer/core/utils/theme/typography.dart';
import 'package:saayer/features/more_sub_features/static_pages/core/enums/enums.dart';
import 'package:saayer/features/more_sub_features/static_pages/presentation/bloc/static_pages_bloc.dart';

class StaticPagesTextHelper {
  final StaticPagesTypes staticPagesType;
  final StaticPagesBloc staticPagesBloc;

  StaticPagesTextHelper({required this.staticPagesType, required this.staticPagesBloc});

  Widget getTextBody() {
    switch (staticPagesType) {
      case StaticPagesTypes.REPLACEMENTREFUNDPOLICY:
        {
          return _getReplacementRefundPolicyText();
        }
      case StaticPagesTypes.PRIVACYPOLICY:
        {
          return _getPrivacyPolicyText();
        }
      case StaticPagesTypes.TERMSCONDITIONS:
        {
          return _getTermsConditionsText();
        }
    }
  }

  Widget _getReplacementRefundPolicyText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(Localization.isArabic() ? StaticPagesText.refundPolicyAr : StaticPagesText.refundPolicyEn,
            style: AppTextStyles.staticPagesBody()),
      ],
    );
  }

  Widget _getPrivacyPolicyText() {
    final privacyPolicyTextMap =
        Localization.isArabic() ? staticPagesBloc.privacyPolicyArTextMap : staticPagesBloc.privacyPolicyEnTextMap;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(
            privacyPolicyTextMap.keys.toList().length,
            (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        privacyPolicyTextMap.keys.toList()[index],
                        style: privacyPolicyTextMap.keys.toList()[index].isEmpty
                            ? null
                            : AppTextStyles.staticPagesHeader(),
                      ),
                      Text(
                        privacyPolicyTextMap.values.toList()[index],
                        style: AppTextStyles.staticPagesBody(),
                      ),
                    ],
                  ),
                ))
      ],
    );
  }

  Widget _getTermsConditionsText() {
    final termsConditionsTextMap =
        Localization.isArabic() ? staticPagesBloc.termsConditionsArTextMap : staticPagesBloc.termsConditionsEnTextMap;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(
            termsConditionsTextMap.values.toList().length,
            (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      (termsConditionsTextMap.keys.toList()[index] == '0' ||
                              termsConditionsTextMap.keys.toList()[index] == '1' ||
                              termsConditionsTextMap.keys.toList()[index] == '4')
                          ? const SizedBox()
                          : Text(
                              termsConditionsTextMap.keys.toList()[index],
                              style: AppTextStyles.staticPagesHeader(),
                            ),
                      Text(
                        termsConditionsTextMap.values.toList()[index],
                        style: AppTextStyles.staticPagesBody(index == 4 ? SaayerTheme().getColorsPalette.error0 : null),
                      ),
                    ],
                  ),
                ))
      ],
    );
  }
}
