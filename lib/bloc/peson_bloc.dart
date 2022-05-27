// ignore_for_file: overridden_fields

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/data/person_repo.dart';
import 'package:rick_and_morty_app/models/person_response_model.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepo repo;

  int maxPage = 1;
  int pageNumber = 0;
  List<Results> allCharacters = [];

  PersonBloc({
    required this.repo,
  }) : super(const PersonInitialState(models: [])) {
    on<GetPersonEvent>((event, emit) async {
      if (pageNumber++ <= maxPage) {
        emit(PersonSuccessState(models: allCharacters, isLoading: true));
        try {
          final result = await repo.getPerson(
            name: event.name ?? '',
            pageNumber: pageNumber,
          );
          allCharacters.addAll(result.results ?? []);
          maxPage = result.info?.pages ?? 1;

          emit(PersonSuccessState(models: allCharacters, isLoading: false));
        } catch (e) {
          emit(const PersonErrorState(models: []));
        }
      }
    });
  }
}

@immutable
abstract class PersonEvent {}

class GetPersonEvent extends PersonEvent {
  final String? name;

  GetPersonEvent({this.name});
}

@immutable
abstract class PersonState {
  final List<Results> models;

  const PersonState({required this.models});
}

class PersonInitialState extends PersonState {
  const PersonInitialState({
    required this.models,
  }) : super(models: models);

  @override
  final List<Results> models;
}

class PersonSuccessState extends PersonState {
  const PersonSuccessState({
    required this.models,
    required this.isLoading,
  }) : super(models: models);

  @override
  final List<Results> models;
  final bool isLoading;
}

class PersonErrorState extends PersonState {
  const PersonErrorState({
    required this.models,
  }) : super(models: models);

  @override
  final List<Results> models;
}
