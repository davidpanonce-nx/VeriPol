import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:veripol/controller/page/page_controller.dart';

({int bottomNavIndex, void Function(int) setBottomNavIndex}) useDashboardPage(WidgetRef ref) {
  final bottomNavIndex = ref.watch(pageControllerProvider).bottomNavIndex;
  final setBottomNavIndex =
      useCallback((int index) => ref.read(pageControllerProvider.notifier).setBottomNavIndex(index), []);
  return (bottomNavIndex: bottomNavIndex, setBottomNavIndex: setBottomNavIndex);
}
