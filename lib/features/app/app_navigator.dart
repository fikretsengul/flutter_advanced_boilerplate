import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_boilerplate/features/app/blocs/app_cubit.dart';
import 'package:flutter_advanced_boilerplate/features/app/widgets/navigation/bottom_navigation.dart';
import 'package:flutter_advanced_boilerplate/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar:
              $constants.navigation.appbars(context).elementAt(state.pageIndex),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: $constants.navigation
                .bottomNavigationScreens()
                .elementAt(state.pageIndex),
          ),
          bottomNavigationBar: BottomNavigation(
            destinations: $constants.navigation.bottomNavigationItems(context),
            currentPageIndex: state.pageIndex,
          ),
        );
      },
    );
  }
}
