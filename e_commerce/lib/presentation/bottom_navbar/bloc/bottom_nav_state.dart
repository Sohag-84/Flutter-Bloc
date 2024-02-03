// ignore_for_file: must_be_immutable

part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavState {}

sealed class BottomNavActionState extends BottomNavState{}

final class BottomNavInitialState extends BottomNavState {
  int currentIndex;
  BottomNavInitialState({required this.currentIndex});
}

final class BottomNavCartPageNavigateState extends BottomNavActionState{}