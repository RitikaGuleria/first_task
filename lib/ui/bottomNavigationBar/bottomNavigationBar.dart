import 'package:first_task/ui/bottomNavigationBar/ScreenA.dart';
import 'package:first_task/ui/bottomNavigationBar/ScreenB.dart';
import 'package:first_task/ui/bottomNavigationBar/ScreenC.dart';
import 'package:first_task/ui/dashboard_screen.dart';
import 'package:first_task/ui/login.dart';
import 'package:first_task/ui/registerUser.dart';
import 'package:first_task/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: "shellA");
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: "shellB");
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: "shellC");

class BottomNav{

  static const splashPath = '/';
  static const homeBottomTab = '/home';
  static const settingBottomTab = '/setting';
  static const callBottomTab = '/c';
  static const loginPath = '/login';
  static const registerationPath ='/registeration';

  static final goRouter = GoRouter(
      initialLocation: splashPath,
      navigatorKey: _rootNavigatorKey,
      routes: [

        GoRoute(path: splashPath,name: 'splash',builder: (context,state) => const SplashScreen()),
        GoRoute(path: loginPath,name: 'login',builder: (context,state) => const LogIn()),
        GoRoute(path: registerationPath,name: 'registeration',builder: (context,state) => const RegisterUser()),

        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return ScaffoldWithNestedNavigation(
                  navigationShell: navigationShell);
            },

            branches: [
              // 1st branch
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorAKey,
                  routes: [
                    GoRoute(path: homeBottomTab,
                      pageBuilder: (context, state) =>
                      const NoTransitionPage(
                          child: ScreenA()),

                      // routes: [
                      //   GoRoute(path: 'dashboard',builder: (context,state) {
                      //     // navigationShell.go('/home/dashboard');
                      //     return const DashboardScreen();
                      //   }
                      //   ),
                      // GoRoute(path: 'dashboard',builder: (context,state) => const DashboardScreen())
                      // ],
                      // routes: [
                      //   GoRoute(path: 'detail',
                      //   builder: (context,state) =>  const ScreenA()),
                      // ]
                    ),
                  ]),

              //2nd branch
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorBKey,
                  routes: [
                    GoRoute(path: callBottomTab,
                      pageBuilder: (context, state) =>
                      const NoTransitionPage(child: ScreenB()),
                    ),
                  ]
              ),

              //3rd branch
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorCKey,
                  routes: [
                    GoRoute(path: settingBottomTab,
                      pageBuilder: (context, state) =>
                      const NoTransitionPage(child: ScreenC()),
                    )
                  ])

            ]),

      ]
  );
}

class ScaffoldWithNestedNavigation extends StatelessWidget {

  const ScaffoldWithNestedNavigation({Key? key,
    required this.navigationShell}) : super(
      key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;


  void _goBranch(int index) {
    navigationShell.goBranch(
        index, initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.add_call), label: 'Calls'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }

}