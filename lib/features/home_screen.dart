import 'package:bharath_work_assessment/di/locator.dart';
import 'package:bharath_work_assessment/features/foryou/bloc/for_you_bloc.dart';
import 'package:bharath_work_assessment/features/foryou/for_you_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _itemCount = 10;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      pageSnapping: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => _forYouWidget(index),
      itemCount: _itemCount,
      onPageChanged: (value) {
        if (value == _itemCount - 1) {
          _itemCount++;
          setState(() {});
        }
      },
    );
  }

  Widget _forYouWidget(int index) {
    return BlocProvider(
      create: (context) => locator.get<ForYouBloc>(),
      child: const ForYouScreen(),
    );
  }
}
