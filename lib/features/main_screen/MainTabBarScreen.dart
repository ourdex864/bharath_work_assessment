import 'package:bharath_work_assessment/features/activity_screen.dart';
import 'package:bharath_work_assessment/features/bookmarks_screen.dart';
import 'package:bharath_work_assessment/features/discover_screen.dart';
import 'package:bharath_work_assessment/features/home_screen.dart';
import 'package:bharath_work_assessment/features/main_screen/bloc/main_screen_bloc.dart';
import 'package:bharath_work_assessment/features/profile_screen.dart';
import 'package:bharath_work_assessment/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainTabBarScreen extends StatefulWidget {
  const MainTabBarScreen({super.key});

  @override
  State<MainTabBarScreen> createState() => _MainTabBarScreenState();
}

class _MainTabBarScreenState extends State<MainTabBarScreen> {
  late MainScreenBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<MainScreenBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.appBg.path), fit: BoxFit.cover)),
              child: Stack(
                children: [
                  _screenItems[state.currentTabIndex],
                ],
              ),
            ),
            bottomNavigationBar: _bottomNavigationBar(state),
          );
        },
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar(MainScreenState state) {
    return BottomNavigationBar(
      items: _bottomTabBarItems(state.currentTabIndex),
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      currentIndex: state.currentTabIndex,
      onTap: (value) => _onBottomNavigationBarTap(value),
    );
  }

  void _onBottomNavigationBarTap(int index) {
    _bloc.add(MainScreenTabChangeEvent(tabIndex: index));
  }

  List<Widget> get _screenItems => [
        HomeScreen(),
        const DiscoverScreen(),
        const ActivityScreen(),
        const BookmarksScreen(),
        const ProfileScreen()
      ];

  List<BottomNavigationBarItem> _bottomTabBarItems(int selectedIndex) {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          Assets.icons.home,
          color: selectedIndex == 0 ? Colors.white : Colors.white54,
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.symbol,
            color: selectedIndex == 1 ? Colors.white : Colors.white54,
          ),
          label: "Discover"),
      // BottomNavigationBarItem(icon: SvgPicture.asset(Assets.icons.bookmarks), label: "Discover"),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.activity,
            color: selectedIndex == 2 ? Colors.white : Colors.white54,
          ),
          label: "Activity"),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.bookmark,
            color: selectedIndex == 3 ? Colors.white : Colors.white54,
          ),
          label: "Bookmarks"),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.profile,
            color: selectedIndex == 4 ? Colors.white : Colors.white54,
          ),
          label: "Profile"),
    ];
  }
}
