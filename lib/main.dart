import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:validcube_gh/pages/blog.dart';
import 'package:validcube_gh/pages/contribution.dart';
import 'package:validcube_gh/pages/credits.dart';
import 'package:validcube_gh/pages/home.dart';
import 'package:validcube_gh/pages/portfolio.dart';
import 'package:validcube_gh/pages/project.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  ThemeData get currentTheme => _isDark ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: GoogleFonts.robotoFlex().fontFamily,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color(0xCC984061),
  ),
  useMaterial3: true,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: GoogleFonts.robotoFlex().fontFamily,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xCC984061),
  ),
  useMaterial3: true,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'validcube.github.io',
      theme: themeProvider.currentTheme,
      home: const MyHomePage(title: 'validcube'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              selectedLabelTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
              trailing: _themeToggle(themeProvider, context),
              labelType: NavigationRailLabelType.all,
              selectedIndex: _currentIndex,
              groupAlignment: -1,
              onDestinationSelected: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              destinations: _navigationDestinations(),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: AnimatedSwitcher(
                switchInCurve: Curves.easeInOutCubic,
                switchOutCurve: Curves.easeInOutCubic,
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: _page(_currentIndex),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<NavigationRailDestination> _navigationDestinations() {
    return const <NavigationRailDestination>[
      NavigationRailDestination(
        padding: EdgeInsets.only(top: 16.0),
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: Text('Home'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.bookmark_border),
        selectedIcon: Icon(Icons.bookmark),
        label: Text('Portfolio'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.book_outlined),
        selectedIcon: Icon(Icons.book),
        label: Text('Project'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.emoji_events_outlined),
        selectedIcon: Icon(Icons.emoji_events),
        label: Text('Contribution'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.rss_feed_outlined),
        selectedIcon: Icon(Icons.rss_feed),
        label: Text('Blog'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.star_outline),
        selectedIcon: Icon(Icons.star),
        label: Text('Credits'),
      ),
    ];
  }

  Widget _themeToggle(ThemeProvider themeProvider, BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ElevatedButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              padding: const EdgeInsets.all(20),
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            child: Icon(
              themeProvider.isDark ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  Widget _page(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const Home();
      case 1:
        return const Portfolio();
      case 2:
        return const Project();
      case 3:
        return const Contribution();
      case 4:
        return const Blog();
      case 5:
        return const Credits();
      default:
        return const Home(); // Handle invalid index gracefully.
    }
  }
}
