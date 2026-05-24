part of 'sign_in.dart';

({
  bool isLoading,
  bool Function(bool) setIsLoading,
  String error,
  String Function(String) setError,
  bool isValid,
  TextEditingController emailController,
  TextEditingController passwordController,
  void Function(bool) setIsGoogleAccount,
  Future<Map<String, dynamic>> Function() signIn,
}) useSignInPage(WidgetRef ref) {
  final emailController = useTextEditingController();
  final passwordController = useTextEditingController();

  final isLoading = useState<bool>(false);
  final error = useState<String>("");

  final setIsLoading = useCallback((bool loading) => isLoading.value = loading, []);
  final setError = useCallback((String err) => error.value = err, []);

  bool isValid = emailController.text.trim().isNotEmpty && passwordController.text.trim().isNotEmpty;

  final setIsGoogleAccount =
      useCallback((bool value) => ref.read(pageControllerProvider.notifier).setIsGoogleAccount(value), []);

  final signIn = useCallback(
    () => ref.read(pageControllerProvider.notifier).signin(
          emailController.text.trim(),
          passwordController.text.trim(),
        ),
    [
      ref,
      emailController.text,
      passwordController.text,
    ],
  );

  return (
    isLoading: isLoading.value,
    setIsLoading: setIsLoading,
    error: error.value,
    setError: setError,
    isValid: isValid,
    emailController: emailController,
    passwordController: passwordController,
    setIsGoogleAccount: setIsGoogleAccount,
    signIn: signIn,
  );
}
