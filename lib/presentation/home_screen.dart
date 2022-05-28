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
    bool isDark = themeCubit.isDark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                themeCubit.toggleTheme();
              },
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: isDark
                    ? ThemeData.light().canvasColor
                    : ThemeData.dark().canvasColor,
              ))
        ],
      ),
      body: Center(
        child: Text(isDark ? 'Hello Good Evening' : 'Hello Good Morning'),
      ),
    );
  }
}
