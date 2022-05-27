import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/bloc/peson_bloc.dart';
import 'package:rick_and_morty_app/data/person_repo.dart';
import 'package:rick_and_morty_app/data/dio_settings.dart';
import 'package:rick_and_morty_app/screens/first_screen/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitialWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick & Morty',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirstScreen(),
      ),
    );
  }
}

class InitialWidget extends StatelessWidget {
  final Widget child;

  const InitialWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) =>
              PersonRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        )
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => PersonBloc(
            repo: RepositoryProvider.of<PersonRepo>(context),
          )..add(GetPersonEvent(name: '')),
        )
      ], child: child),
    );
  }
}
