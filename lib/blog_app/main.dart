// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'core/common/cubits/app_user_cubit.dart';
// import 'core/init/init_dependencies.dart';
// import 'core/theme/theme.dart';
// import 'features/auth/presentation/bloc/bloc/auth_bloc.dart';
// import 'features/auth/presentation/pages/login_page.dart';
// import 'features/blog/presentation/pages/blog_page.dart';

// void main() async {
//   await initDependencies();
//   runApp(MultiBlocProvider(providers: [
//     BlocProvider(
//       create: (_) => serviceLocator<AuthBloc>(),
//     ),
//     BlocProvider(
//       create: (_) => serviceLocator<AppUserCubit>(),
//     )
//   ], child: const MyApp()));
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.darkThemeMode,
//       home: BlocSelector<AppUserCubit, AppUserState, bool>(
//         selector: (state) {
//           return state is AppUserLoggedIn;
//         },
//         builder: (context, isLoggedIn) {
//           if (isLoggedIn) {
//             return const BlogPage();
//           }
//           return const LoginPage();
//         },
//       ),
//     );
//   }
// }
