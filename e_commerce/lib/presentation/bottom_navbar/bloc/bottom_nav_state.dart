part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavState {}

final class BottomNavInitialState extends BottomNavState {
  final int currentIndex;
  BottomNavInitialState({required this.currentIndex});
}
