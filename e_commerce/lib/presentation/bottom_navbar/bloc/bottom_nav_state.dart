// ignore_for_file: must_be_immutable

part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavState {}

final class BottomNavInitialState extends BottomNavState {
  int currentIndex;
  BottomNavInitialState({required this.currentIndex});
}
