import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/main/main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_twotone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
}


class MonthFormatter {
  static String getMonthName(int month, {String locale = 'id_ID'}) {
    final date = DateTime(2000, month);
    return DateFormat('MMMM', locale).format(date);
  }

  static List<String> getAllMonths({String locale = 'id_ID'}) {
    return List.generate(12, (index) => getMonthName(index + 1, locale: locale));
  }

  static String formatMonthYear(int month, int year, {String locale = 'id_ID'}) {
    final date = DateTime(year, month);
    return DateFormat('MMMM yyyy', locale).format(date);
  }
}





class MainScreen extends StatefulWidget {
    final Widget child;
    const MainScreen({super.key, required this.child});

    @override
    State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
    int _selectedIndex = 0;
    final PageController _pageController = PageController();


    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });


        _pageController.animateToPage(
            index, 
            duration: const Duration(milliseconds: 300), 
            curve: Curves.easeInOut
        );
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: [
                    PageView(
                        controller: _pageController,
                        onPageChanged: (value) => setState(() => _selectedIndex = value),
                        children: [
                            const HomeScreen(),
                            const SearchScreen(),
                            const AddPostScreen(),
                            const HistoryScreen(),
                            const ProfileScreen(),
                        ],
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: SizedBox(
                                    height: 70,
                                    child: BottomNavigationBar(
                                        items: [
                                            BottomNavigationBarItem(
                                                icon: Iconify(
                                                    IconParkTwotone.home_two,
                                                    color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                                                ),
                                                label: AppLocalizations.of(context)!.home,
                                            ),
                                            BottomNavigationBarItem(
                                                icon: Iconify(
                                                    IconParkTwotone.search,
                                                    color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                                                ),
                                                label: AppLocalizations.of(context)!.search,
                                            ),
                                            BottomNavigationBarItem(
                                                icon: Iconify(
                                                    IconParkTwotone.add_one,
                                                    color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                                                ),
                                                label: AppLocalizations.of(context)!.add,
                                            ),
                                            BottomNavigationBarItem(
                                                icon: Iconify(
                                                    IconParkTwotone.list_one,
                                                    color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                                                ),
                                                label: AppLocalizations.of(context)!.list,
                                            ),
                                            BottomNavigationBarItem(
                                                icon: Iconify(
                                                    IconParkTwotone.people,
                                                    color: _selectedIndex == 4 ? Colors.white : Colors.grey,
                                                ),
                                                label: AppLocalizations.of(context)!.account,
                                            ),
                                        ],
                                        type: BottomNavigationBarType.fixed,
                                        currentIndex: _selectedIndex,
                                        selectedLabelStyle: const TextStyle(
                                            fontSize: 10,
                                            height: 2,
                                        ),
                                        unselectedLabelStyle: const TextStyle(
                                            fontSize: 10,
                                            height: 2,
                                        ),
                                        iconSize: 30,
                                        selectedIconTheme: IconThemeData(size: 30),
                                        elevation: 10,
                                        unselectedIconTheme: IconThemeData(size: 30),
                                        onTap: _onItemTapped,
                                        backgroundColor: Color(0xFF111111),
                                        selectedItemColor: Colors.white,
                                        unselectedItemColor: Colors.grey,
                                    ),
                                ),
                            ),
                        )
                    ),
                ],
            ),
        );
    }
}