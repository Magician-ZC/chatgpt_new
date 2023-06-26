import 'package:chatgpt_new/screens/chat_history_screen.dart';
import 'package:chatgpt_new/screens/home_screen.dart';
import 'package:chatgpt_new/screens/settings_screen.dart';
import 'package:chatgpt_new/util/utils.dart';
import 'package:go_router/go_router.dart';

final router = isDesktop() ? desktopRouter : mobileRouter;
final mobileRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/history', builder: (context, state) => const ChatHistoryScreen()),
  GoRoute(
      path: '/settings', builder: (context, state) => const SettingScreen()),
]);

final desktopRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const DesktopHomeScreen()),
]);
