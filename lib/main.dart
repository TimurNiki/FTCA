import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arc_application/core/theme/theme.dart';
import 'package:flutter_clean_arc_application/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter_clean_arc_application/features/auth/presentation/pages/sign_up_page.dart';
import 'core/init/init_dependencies.dart';

void main() async {
  await initDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => serviceLocator<AuthBloc>(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const SignUpPage(),
    );
  }
}
