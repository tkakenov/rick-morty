import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/data/person_repo.dart';
import 'package:rick_and_morty_app/models/person_detail_model.dart';
import 'package:rick_and_morty_app/models/person_response_model.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepo repo;

  int maxPage = 1;
  List<Results> allCharacters = [];

  PersonBloc({
    required this.repo,
  }) : super(const PersonInitialState(models: [])) {
    on<GetPersonEvent>((event, emit) async {
      if ((event.pageNumber ?? 1) <= maxPage) {
        emit(
          PersonSuccessState(
            models: allCharacters,
            isLoading: true,
            detail: PersonDetailModel(),
          ),
        );

        try {
          final result = await repo.getPerson(
            name: event.name ?? '',
            pageNumber: event.pageNumber ?? 1,
          );
          if (!event.isForSearch) {
            allCharacters.addAll(result.results ?? []);
            maxPage = result.info?.pages ?? 1;

            emit(
              PersonSuccessState(
                models: allCharacters,
                isLoading: false,
                detail: PersonDetailModel(),
              ),
            );
          } else {
            emit(
              PersonSuccessState(
                models: result.results ?? [],
                isLoading: false,
                detail: PersonDetailModel(),
              ),
            );
          }
        } catch (e) {
          emit(const PersonErrorState(models: []));
        }
      }
    });
    on<GetDetailPersonEvent>((event, emit) async {
      emit(const PersonLoadingState(models: []));

      try {
        final result = await repo.getDetailPerson(
          id: event.id,
        );

        emit(
          PersonSuccessState(
            models: const [],
            isLoading: false,
            detail: result,
          ),
        );
      } catch (e) {
        emit(const PersonErrorState(models: []));
      }
    });
  }
}

@immutable
abstract class PersonEvent {}

class GetPersonEvent extends PersonEvent {
  final String? name;
  final int? pageNumber;
  final bool isForSearch;

  GetPersonEvent({
    this.name,
    this.pageNumber,
    this.isForSearch = false,
  });
}

class GetDetailPersonEvent extends PersonEvent {
  final int id;

  GetDetailPersonEvent({required this.id});
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

class PersonLoadingState extends PersonState {
  const PersonLoadingState({
    required this.models,
  }) : super(models: models);

  @override
  final List<Results> models;
}

class PersonSuccessState extends PersonState {
  const PersonSuccessState({
    required this.models,
    required this.isLoading,
    required this.detail,
  }) : super(models: models);

  @override
  final List<Results> models;
  final PersonDetailModel detail;
  final bool isLoading;
}

class PersonErrorState extends PersonState {
  const PersonErrorState({
    required this.models,
  }) : super(models: models);

  @override
  final List<Results> models;
}
