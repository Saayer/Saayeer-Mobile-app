import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/more_sub_features/static_pages/core/enums/enums.dart';

part 'static_pages_event.dart';

part 'static_pages_state.dart';

@Injectable()
class StaticPagesBloc extends Bloc<StaticPagesEvent, StaticPagesState> {
  StaticPagesBloc() : super(const StaticPagesState());

  final Map<String,String> privacyPolicyEnTextMap = {
    '' : StaticPagesText.privacyPolicyEn1,
    StaticPagesText.privacyPolicyHeaderEn2 : StaticPagesText.privacyPolicyEn2,
    StaticPagesText.privacyPolicyHeaderEn3 : StaticPagesText.privacyPolicyEn3,
    StaticPagesText.privacyPolicyHeaderEn4 : StaticPagesText.privacyPolicyEn4,
    StaticPagesText.privacyPolicyHeaderEn5 : StaticPagesText.privacyPolicyEn5,
    StaticPagesText.privacyPolicyHeaderEn6 : StaticPagesText.privacyPolicyEn6,
    StaticPagesText.privacyPolicyHeaderEn7 : StaticPagesText.privacyPolicyEn7,
    StaticPagesText.privacyPolicyHeaderEn8 : StaticPagesText.privacyPolicyEn8,
    StaticPagesText.privacyPolicyHeaderEn9 : StaticPagesText.privacyPolicyEn9,
    StaticPagesText.privacyPolicyHeaderEn10 : StaticPagesText.privacyPolicyEn10,
    StaticPagesText.privacyPolicyHeaderEn11 : StaticPagesText.privacyPolicyEn11,
    StaticPagesText.privacyPolicyHeaderEn12 : StaticPagesText.privacyPolicyEn12,
  };

  final Map<String,String> privacyPolicyArTextMap = {
    '' : StaticPagesText.privacyPolicyAr1,
    StaticPagesText.privacyPolicyHeaderAr2 : StaticPagesText.privacyPolicyAr2,
    StaticPagesText.privacyPolicyHeaderAr3 : StaticPagesText.privacyPolicyAr3,
    StaticPagesText.privacyPolicyHeaderAr4 : StaticPagesText.privacyPolicyAr4,
    StaticPagesText.privacyPolicyHeaderAr5 : StaticPagesText.privacyPolicyAr5,
    StaticPagesText.privacyPolicyHeaderAr6 : StaticPagesText.privacyPolicyAr6,
    StaticPagesText.privacyPolicyHeaderAr7 : StaticPagesText.privacyPolicyAr7,
    StaticPagesText.privacyPolicyHeaderAr8 : StaticPagesText.privacyPolicyAr8,
    StaticPagesText.privacyPolicyHeaderAr9 : StaticPagesText.privacyPolicyAr9,
    StaticPagesText.privacyPolicyHeaderAr10 : StaticPagesText.privacyPolicyAr10,
    StaticPagesText.privacyPolicyHeaderAr11 : StaticPagesText.privacyPolicyAr11,
    StaticPagesText.privacyPolicyHeaderAr12 : StaticPagesText.privacyPolicyAr12,
  };

  final Map<String,String> termsConditionsEnTextMap = {
    '0' : StaticPagesText.termsConditionsEn1,
    '1' : StaticPagesText.termsConditionsEn2,
    StaticPagesText.termsConditionsHeaderEn3 : StaticPagesText.termsConditionsEn3,
    StaticPagesText.termsConditionsHeaderEn4 : StaticPagesText.termsConditionsEn4,
    '4' : StaticPagesText.termsConditionsColoredEn4,
    StaticPagesText.termsConditionsHeaderEn5 : StaticPagesText.termsConditionsEn5,
    StaticPagesText.termsConditionsHeaderEn6 : StaticPagesText.termsConditionsEn6,
    StaticPagesText.termsConditionsHeaderEn7 : StaticPagesText.termsConditionsEn7,
    StaticPagesText.termsConditionsHeaderEn8 : StaticPagesText.termsConditionsEn8,
    StaticPagesText.termsConditionsHeaderEn9 : StaticPagesText.termsConditionsEn9,
    StaticPagesText.termsConditionsHeaderEn10 : StaticPagesText.termsConditionsEn10,
    StaticPagesText.termsConditionsHeaderEn11 : StaticPagesText.termsConditionsEn11,
    StaticPagesText.termsConditionsHeaderEn12 : StaticPagesText.termsConditionsEn12,
    StaticPagesText.termsConditionsHeaderEn13 : StaticPagesText.termsConditionsEn13,
  };

  final Map<String,String> termsConditionsArTextMap = {
    '0' : StaticPagesText.termsConditionsAr1,
    '1' : StaticPagesText.termsConditionsAr2,
    StaticPagesText.termsConditionsHeaderAr3 : StaticPagesText.termsConditionsAr3,
    StaticPagesText.termsConditionsHeaderAr4 : StaticPagesText.termsConditionsAr4,
    '4' : StaticPagesText.termsConditionsColoredAr4,
    StaticPagesText.termsConditionsHeaderAr5 : StaticPagesText.termsConditionsAr5,
    StaticPagesText.termsConditionsHeaderAr6 : StaticPagesText.termsConditionsAr6,
    StaticPagesText.termsConditionsHeaderAr7 : StaticPagesText.termsConditionsAr7,
    StaticPagesText.termsConditionsHeaderAr8 : StaticPagesText.termsConditionsAr8,
    StaticPagesText.termsConditionsHeaderAr9 : StaticPagesText.termsConditionsAr9,
    StaticPagesText.termsConditionsHeaderAr10 : StaticPagesText.termsConditionsAr10,
    StaticPagesText.termsConditionsHeaderAr11 : StaticPagesText.termsConditionsAr11,
    StaticPagesText.termsConditionsHeaderAr12 : StaticPagesText.termsConditionsAr12,
    StaticPagesText.termsConditionsHeaderAr13 : StaticPagesText.termsConditionsAr13,
  };
}
