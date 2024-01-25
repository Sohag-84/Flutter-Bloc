import 'package:flutter/foundation.dart';

@immutable
sealed class UserEvent {}

final class UserFetchedEvent extends UserEvent {}
