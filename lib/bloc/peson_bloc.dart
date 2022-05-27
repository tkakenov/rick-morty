import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/data/person_repo.dart';
import 'package:rick_and_morty_app/models/person_response_model.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepo repo;

  PersonBloc({
    required this.repo,
  }) : super(PersonInitialState()) {
    on<GetPersonEvent>((event, emit) async {
      emit(PersonLoadingState());
      try {
        final result = await repo.getPerson(name: event.name);

        emit(PersonSuccessState(result: result.results));
      } catch (e) {
        emit(PersonErrorState());
      }
    });
  }
}

@immutable
abstract class PersonEvent {}

class GetPersonEvent extends PersonEvent {
  final String name;

  GetPersonEvent({required this.name});
}

@immutable
abstract class PersonState {}

class PersonInitialState extends PersonState {}

class PersonLoadingState extends PersonState {}

class PersonSuccessState extends PersonState {
  final List<Results>? result;
  PersonSuccessState({required this.result});
}

class PersonErrorState extends PersonState {}
