import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:saayer/core/helpers/state_helper/state_helper.dart';
import 'package:saayer/core/utils/enums.dart';
import 'package:saayer/features/personal_info/core/utils/enums/enums.dart';
import 'package:saayer/features/personal_info/domain/entities/personal_info_entity.dart';
import 'package:saayer/features/personal_info/domain/entities/submit_personal_info_entity.dart';

part 'personal_info_event.dart';

part 'personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(const PersonalInfoState()) {
    on<PersonalInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nationalIDController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  Map<PersonalInfoFieldsTypes, bool> personalInfoFieldsValidMap = {};
}
