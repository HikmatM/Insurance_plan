import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:insurance_plan/router/app_router.gr.dart';
import 'package:insurance_plan/ui_kit/constants/colors.dart';
import 'package:insurance_plan/ui_kit/widgets/global_app_bar.dart';
import 'package:insurance_plan/widgets/navigation_bar/destination.dart';

@RoutePage()
class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    final useSideNav = MediaQuery.sizeOf(context).width >= 600;
    return AutoTabsScaffold(
        backgroundColor: CustomColors.systemWhite,
        drawerEnableOpenDragGesture: true,
        resizeToAvoidBottomInset: false,
        routes: [
          const HomeRoute(),
          DetailRoute(),
        ],
        appBarBuilder: (_, tabsRouter) =>
            GlobalAppBar(title: destinations[tabsRouter.activeIndex].label),
        drawer: useSideNav ? const SideNavBar() : null,
        transitionBuilder: (context, child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
        bottomNavigationBuilder: (_, tabsRouter) => useSideNav
            ? const SizedBox()
            : BottomNavBar(
                selectedIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex));
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  const BottomNavBar(
      {required this.selectedIndex,
      required this.onDestinationSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations.map((e) {
          return NavigationDestination(icon: Icon(e.icon), label: e.label);
        }).toList());
  }
}

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Padding(
          padding: const EdgeInsets.only(left: 1.0, top: 20),
          child: ListView.separated(
            itemCount: destinations.length,
            itemBuilder: (context, index) => ListTile(
                selected: context.tabsRouter.activeIndex == index,
                selectedTileColor: CustomColors.systemBlue,
                selectedColor: CustomColors.systemWhite,
                onTap: () {
                  context.tabsRouter.setActiveIndex(index);
                  Navigator.pop(context); // Close the drawer
                },
                leading: Icon(destinations[index].icon),
                title: Text(
                  destinations[index].label,
                  textAlign: TextAlign.left,
                )),
            separatorBuilder: (context, index) => const Divider(
              height: 1,
            ),
          ),
        ));
  }
}
