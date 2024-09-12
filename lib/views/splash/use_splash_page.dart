part of 'splash.dart';

double useSplashPage() {
  final context = useContext();
  // Using Flutter Hook to manage the breathing animation controller
  final breathingAnimation = useAnimationController(
    duration: const Duration(milliseconds: 500),
  )..forward();

  final breathe = useAnimation(Tween<double>(begin: 0.8, end: 1.5).animate(
    CurvedAnimation(parent: breathingAnimation, curve: Curves.easeOut),
  ));

  Future<void> checkFirstInstall(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final firstInstall = prefs.getBool('firstInstall') ?? true;

    if (context.mounted) {
      if (firstInstall) {
        context.pushReplacement(Routes.onboarding);
        prefs.setBool('firstInstall', false);
      } else {
        context.pushReplacement(Routes.authHome);
      }
    }
  }

  useEffect(() {
    // Trigger the first-install check after the first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkFirstInstall(context);
    });
    return null;
  }, []);

  return breathe;
}
