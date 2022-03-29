import 'package:flutter/material.dart';
import 'package:ordo/pages/dashboard_page.dart';
import 'package:ordo/provider/app_provider.dart';
import 'package:provider/provider.dart';

class WrapperApp extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
        ],
        builder: (context, child) {
          return Scaffold(
            bottomNavigationBar:
                Consumer<AppProvider>(builder: (context, appProvider, child) {
              return BottomNavigationBar(
                onTap: (index) => appProvider.changePage(index, () {
                  pageController.animateToPage(index,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                }),
                elevation: 0,
                backgroundColor: Colors.transparent,
                showSelectedLabels: false,
                currentIndex: appProvider.navbar,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.assignment_rounded,
                      size: 26,
                      color: Color(0xff47623F),
                    ),
                    icon: Icon(
                      Icons.assignment_rounded,
                      size: 26,
                      color: Color(0xffC6C4C4),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.swap_horiz_rounded,
                      size: 26,
                      color: Color(0xff47623F),
                    ),
                    icon: Icon(
                      Icons.swap_horiz_rounded,
                      size: 26,
                      color: Color(0xffC6C4C4),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.home_rounded,
                      size: 26,
                      color: Color(0xff47623F),
                    ),
                    icon: Icon(
                      Icons.home_rounded,
                      size: 26,
                      color: Color(0xffC6C4C4),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.assessment_rounded,
                      size: 26,
                      color: Color(0xff47623F),
                    ),
                    icon: Icon(
                      Icons.assessment_rounded,
                      size: 26,
                      color: Color(0xffC6C4C4),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.person_rounded,
                      size: 26,
                      color: Color(0xff47623F),
                    ),
                    icon: Icon(
                      Icons.person_rounded,
                      size: 26,
                      color: Color(0xffC6C4C4),
                    ),
                    label: '',
                  )
                ],
              );
            }),
            body: Consumer<AppProvider>(builder: (context, appProvider, child) {
              return PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  DahsboardPage(),
                  DahsboardPage(),
                  DahsboardPage(),
                  DahsboardPage(),
                  DahsboardPage()
                ],
              );
            }),
          );
        });
  }
}
