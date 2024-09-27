import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/analytics/presentation/screen.dart';
import 'package:run_tracker/feature/home/presentation/screen.dart';
import 'package:run_tracker/feature/settings/presentation/screen.dart';
import 'package:universal_platform/universal_platform.dart';

const _homePosition = 0;
const _analyticsPosition = 1;
const _settingsPosition = 2;

final class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootState();
}

final class _RootState extends ConsumerState<RootScreen> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final strings = AppLocalizations.of(context)!;

    return Scaffold(
      extendBody: true,
      body: switch (_selectedIndex) {
        _homePosition => const HomeScreen(),
        _analyticsPosition => const AnalyticsScreen(),
        _settingsPosition => const SettingsScreen(),
        _ => Container()
      },
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(theme.dimensions.radius.small),
            topRight: Radius.circular(theme.dimensions.radius.small),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(theme.dimensions.radius.small),
            topRight: Radius.circular(theme.dimensions.radius.small),
          ),
          child: _buildBottomNavigationBar(theme, strings),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(AppTheme theme, AppLocalizations strings) =>
      UniversalPlatform.isIOS
          ? _cupertinoBottomBar(theme, strings)
          : _materialBottomBar(theme, strings);

  Widget _materialBottomBar(AppTheme theme, AppLocalizations strings) =>
      BottomNavigationBar(
        backgroundColor: theme.colors.bottomBar.background,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: strings.home_home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.analytics),
            label: strings.home_analytics,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: strings.home_settings,
          ),
        ],
        selectedItemColor: theme.colors.bottomBar.selected,
        unselectedItemColor: theme.colors.bottomBar.unselected,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      );

  Widget _cupertinoBottomBar(AppTheme theme, AppLocalizations strings) =>
      CupertinoTabBar(
        activeColor: theme.colors.indicator.primary,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.home),
            label: strings.home_home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.chart_bar_alt_fill),
            label: strings.home_analytics,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.settings),
            label: strings.home_settings,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      );
}