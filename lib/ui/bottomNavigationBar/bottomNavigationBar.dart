import 'dart:js';

import 'package:first_task/ui/bottomNavigationBar/ScreenA.dart';
import 'package:first_task/ui/bottomNavigationBar/ScreenB.dart';
import 'package:first_task/ui/bottomNavigationBar/ScreenC.dart';
import 'package:first_task/ui/login.dart';
import 'package:first_task/ui/registerUser.dart';
import 'package:first_task/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final navigatorProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>(debugLabel: 'main navigator');
});

class BottomNav {
  // final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: "shellA");
  // final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: "shellB");
  // final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: "shellC");

  static const splashPath = '/';
  static const homeBottomTab = '/home';
  static const settingBottomTab = '/setting';
  static const callBottomTab = '/c';
  static const loginPath = '/login';
  static const registerationPath = '/registeration';

  final goRouter = Provider.autoDispose<GoRouter>((ref) {
    final r = GoRouter(
        initialLocation: splashPath,
        navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'rootKey'),
        routes: [
          GoRoute(
              path: splashPath,
              name: 'splash',
              builder: (context, state) => const SplashScreen()),
          GoRoute(
              path: loginPath,
              name: 'login',
              builder: (context, state) => const LogIn()),
          GoRoute(
              path: registerationPath,
              name: 'registeration',
              builder: (context, state) => const RegisterUser()),
          StatefulShellRoute.indexedStack(
              // parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state, navigationShell) {
                return ScaffoldWithNestedNavigation(
                    navigationShell: navigationShell);
              },
              branches: [
                // 1st branch
                StatefulShellBranch(
                    navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'A'),
                    routes: [
                      GoRoute(
                        path: homeBottomTab,
                        pageBuilder: (context, state) =>
                            const NoTransitionPage(child: ScreenA()),
                      ),
                    ]),

                //2nd branch
                StatefulShellBranch(
                    navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'B'),
                    routes: [
                      GoRoute(
                        path: callBottomTab,
                        pageBuilder: (context, state) =>
                            const NoTransitionPage(child: ScreenB()),
                      ),
                    ]),

                //3rd branch
                StatefulShellBranch(
                    navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'C'),
                    routes: [
                      GoRoute(
                        path: settingBottomTab,
                        pageBuilder: (context, state) =>
                            const NoTransitionPage(child: ScreenC()),
                      )
                    ])
              ]),
        ]);
    ref.onDispose(() => r.dispose());
    return r;
  });
}

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({Key? key, required this.navigationShell})
      : super(key: key,);

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index, BuildContext context) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);

    if (index == 0) {
      GoRouter.of(context).go(BottomNav.homeBottomTab);
    } else if (index == 1) {
      GoRouter.of(context).go(BottomNav.callBottomTab);
    } else if (index == 2) {
      GoRouter.of(context).go(BottomNav.settingBottomTab);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        // onTap : (index) => _goBranch(index,context),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.add_call), label: 'Calls'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onDestinationSelected: (index) => _goBranch(index,context),
      ),
    );
  }
}
