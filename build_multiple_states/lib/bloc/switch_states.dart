import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isEnable;
  const SwitchState({this.isEnable = false});

  @override
  List<Object?> get props => [isEnable];

  SwitchState copyWith({
    bool? isEnable,
  }) {
    return SwitchState(
      isEnable: isEnable ?? this.isEnable,
    );
  }
}
