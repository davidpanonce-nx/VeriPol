part of 'personal_info_page.dart';

({
  bool isValid,
  TextEditingController firstNameController,
  TextEditingController lastNameController,
}) usePersonalInfoPage() {
  final firstNameController = useTextEditingController();
  final lastNameController = useTextEditingController();

  bool isValid = firstNameController.text.trim().isNotEmpty && lastNameController.text.trim().isNotEmpty;

  return (
    isValid: isValid,
    firstNameController: firstNameController,
    lastNameController: lastNameController,
  );
}
