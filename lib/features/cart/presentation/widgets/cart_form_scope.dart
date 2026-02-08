import 'package:flutter/widgets.dart';

class CartFormScope extends InheritedWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController zipController;
  final TextEditingController countryController;
  final bool showErrors;
  final int currentStep;
  final bool Function(bool showErrors) isNextDisabledForCurrentStep;
  final bool Function(String email) isValidEmail;
  final bool Function(String phone) isValidPhone;

  const CartFormScope({
    required super.child,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.addressController,
    required this.cityController,
    required this.zipController,
    required this.countryController,
    required this.showErrors,
    required this.currentStep,
    required this.isNextDisabledForCurrentStep,
    required this.isValidEmail,
    required this.isValidPhone,
    super.key,
  });

  static CartFormScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<CartFormScope>();
    assert(scope != null, 'CartFormScope non trouvé dans le contexte');
    return scope!;
  }

  @override
  bool updateShouldNotify(covariant CartFormScope oldWidget) {
    return showErrors != oldWidget.showErrors || currentStep != oldWidget.currentStep;
  }
}
