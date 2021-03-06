import 'package:equatable/equatable.dart';
import 'package:fleetup/api/group.dart';
import 'package:meta/meta.dart';

abstract class MyGroupsState extends Equatable {
  MyGroupsState([List props = const []]) : super(props);
}

class MyGroupsLoading extends MyGroupsState {
  @override
  String toString() => 'MyGroupsLoading';
}

class MyGroupsLoaded extends MyGroupsState {
  final List<Group> groups;

  MyGroupsLoaded({this.groups = const []}) : super([groups]);

  @override
  String toString() {
    return 'MyGroupsSuccess{groups: $groups}';
  }
}

class MyGroupsFailure extends MyGroupsState {
  final String error;

  MyGroupsFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'MyGroupsFailure { error: $error }';
}
