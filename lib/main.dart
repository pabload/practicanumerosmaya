import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicanumerosmaya/aplicacion/pagina_practicacubit.dart';
import 'package:practicanumerosmaya/interfaces/paginas/principal/principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PaginaPracticaCubit(),
      child: MaterialApp(
        title: 'Practica los numeros en maya',
        home: PaginaPrincipal(),
      ),
    );
  }
}
