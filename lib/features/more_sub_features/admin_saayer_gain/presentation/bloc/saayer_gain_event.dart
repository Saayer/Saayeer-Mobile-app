part of 'saayer_gain_bloc.dart';

abstract class SaayerGainEvent extends Equatable {
  const SaayerGainEvent();
}

class GetSaayerGain extends SaayerGainEvent {
  const GetSaayerGain();

  @override
  List<Object> get props => [];
}

class UpdateSaayerGain extends SaayerGainEvent {
  final GainRatioPost gainRatioPost;

  const UpdateSaayerGain({required this.gainRatioPost});

  @override
  List<Object> get props => [
        gainRatioPost,
      ];
}

class OnChangeSaayerGainPercentage extends SaayerGainEvent {
  final int saayerGain;

  const OnChangeSaayerGainPercentage({required this.saayerGain});

  @override
  List<Object> get props => [
        saayerGain,
      ];
}
