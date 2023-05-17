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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                isDark ? 'Hello,\nGood night 🥱' : 'Hello,\nGood Morning 🌅 ',
                textAlign: TextAlign.center,
                style: const TextStyle(height: 1.5, fontSize: 20),
              ),
              Image.asset(
                isDark ? 'assets/night.png' : 'assets/namaste.png',
                height: 250,
              ),
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
