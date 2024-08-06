import 'package:clean_architecture/presentation/screens/main_page/bloc/main_page_bloc.dart';
import 'package:clean_architecture/presentation/screens/main_page/widgets/bottom_menu.dart';
import 'package:clean_architecture/presentation/screens/main_page/widgets/menu_list.dart';
import 'package:clean_architecture/presentation/screens/main_page/widgets/top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageWrapperProvider extends StatelessWidget {
  const MainPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageBloc(),
      child: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        body: Column(children: const [
          TopMenu(),
          MenuList(),
          BottomMenu(),
        ]),
      ),
    );
  }
}
