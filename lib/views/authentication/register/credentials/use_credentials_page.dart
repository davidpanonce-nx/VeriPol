part of 'credentials_page.dart';

({
  TextEditingController emailController,
  TextEditingController passwordController,
  TextEditingController confirmPasswordController,
  bool isValid,
  bool isLoading,
  bool Function(bool) setIsLoading,
  String error,
  String Function(String) setError,
  void Function(bool) setIsGoogleAccount,
  Future<Map<String, dynamic>> Function() signUp,
}) useCredentialsPage(WidgetRef ref, String firstName, String lastName) {
  final emailController = useTextEditingController();
  final passwordController = useTextEditingController();
  final confirmPasswordController = useTextEditingController();

  final isLoading = useState<bool>(false);
  final setIsLoading = useCallback((bool loading) => isLoading.value = loading, []);

  final error = useState<String>("");
  final setError = useCallback((String err) => error.value = err, []);

  final isValid = emailController.text.trim().isNotEmpty &&
      passwordController.text.trim().isNotEmpty &&
      confirmPasswordController.text.trim().isNotEmpty;

  final setIsGoogleAccount = useCallback(
    (bool value) => ref.read(pageControllerProvider.notifier).setIsGoogleAccount(value),
    [],
  );

  final signUp = useCallback(
    () => ref.read(pageControllerProvider.notifier).signup(
          firstName,
          lastName,
          emailController.text.trim(),
          passwordController.text.trim(),
        ),
    [emailController.text, passwordController.text],
  );

  return (
    emailController: emailController,
    passwordController: passwordController,
    confirmPasswordController: confirmPasswordController,
    isValid: isValid,
    isLoading: isLoading.value,
    setIsLoading: setIsLoading,
    error: error.value,
    setError: setError,
    setIsGoogleAccount: setIsGoogleAccount,
    signUp: signUp,
  );
}
