import 'dart:async';

import 'package:bloc/bloc.dart';

import 'my_groups.dart';

class MyGroupsBloc extends Bloc<MyGroupsEvent, MyGroupsState> {
  MyGroupsBloc();

  @override
  MyGroupsState get initialState => MyGroupsInitial();

  @override
  Stream<MyGroupsState> mapEventToState(MyGroupsEvent event) async* {}
}
