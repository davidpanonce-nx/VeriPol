import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

enum RoutingType {
  fade,
  rotation,
  size,
  scale,
  slide,
}

class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage({
    required LocalKey key,
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    RoutingType? type,
    int duration = 700,
  }) {
    return CustomTransitionPage(
        key: key,
        child: child,
        transitionDuration: Duration(milliseconds: duration),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
          final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOutCirc);
          final offsetAnimation = curvedAnimation.drive(tween);
          return switch (type) {
            RoutingType.fade => FadeTransition(
                opacity: curvedAnimation,
                child: child,
              ),
            RoutingType.rotation => RotationTransition(
                turns: curvedAnimation,
                child: child,
              ),
            RoutingType.size => SizeTransition(
                sizeFactor: curvedAnimation,
                child: child,
              ),
            RoutingType.scale => ScaleTransition(
                scale: curvedAnimation,
                child: child,
              ),
            null || RoutingType.slide => SlideTransition(
                position: offsetAnimation,
                child: child,
              ),
          };
        });
  }
}
