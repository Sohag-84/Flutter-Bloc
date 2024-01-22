import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isEnable;
  final double sliderValue;
  const SwitchState({this.isEnable = false, this.sliderValue = 0.0});

  @override
  List<Object?> get props => [isEnable, sliderValue];

  SwitchState copyWith({
    bool? isEnable,
    double? sliderValue,
  }) {
    return SwitchState(
      isEnable: isEnable ?? this.isEnable,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }
}
