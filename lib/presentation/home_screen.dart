import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/cubit/cubit/theme_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              themeCubit.toggleTheme();
            },
            icon: const Icon(Icons.dark_mode))
      ]),
    );
  }
}
