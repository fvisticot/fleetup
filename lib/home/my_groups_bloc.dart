import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fleetup/api/meetup_repository.dart';
import 'package:meta/meta.dart';

import 'my_groups.dart';

class MyGroupsBloc extends Bloc<MyGroupsEvent, MyGroupsState> {
  final MeetupRepository meetupRepository;
  MyGroupsBloc({@required this.meetupRepository}) {
    dispatch(LoadMyGroupsEvent());
  }

  @override
  MyGroupsState get initialState => MyGroupsLoading();

  @override
  Stream<MyGroupsState> mapEventToState(MyGroupsEvent event) async* {
    final groups = await meetupRepository.myGroups();
    yield MyGroupsLoaded(groups: groups);
  }
}
