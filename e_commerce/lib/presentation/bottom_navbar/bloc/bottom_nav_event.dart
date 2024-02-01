part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

final class BottomNavPageIndexChangedEvent extends BottomNavEvent{
  final int pageIndex;

  BottomNavPageIndexChangedEvent({required this.pageIndex});
}
