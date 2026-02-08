import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_bnj/core/utils/responsive.dart';
import 'package:test_flutter_bnj/features/cart/domain/entities/cart_item.dart';
import 'package:test_flutter_bnj/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:test_flutter_bnj/features/cart/presentation/widgets/cart_form_scope.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // 0: Infos client, 1: Livraison, 2: Paiement, 3: Confirmation
  int _currentStep = 0;
  bool _showErrors = false;

  // Champs client
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  // Champs livraison
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final countryController = TextEditingController(text: 'France');

  @override
  void initState() {
    super.initState();
    // Attacher des listeners pour reconstruire l’UI quand l’utilisateur corrige les champs
    void attach(TextEditingController c) {
      c.addListener(() {
        // Optionnel: on peut aussi nettoyer les erreurs automatiquement quand tout est valide
        setState(() {
          // Si on est sur l’étape en cours et que toutes les saisies sont valides, on peut désactiver l’affichage d’erreurs
          if (_currentStep == 0 && !_isCustomerStepInvalid()) {
            _showErrors = false;
          } else if (_currentStep == 1 && !_isShippingStepInvalid()) {
            _showErrors = false;
          }
        });
      });
    }
    attach(nameController);
    attach(emailController);
    attach(phoneController);
    attach(addressController);
    attach(cityController);
    attach(zipController);
    attach(countryController);
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  bool _isValidPhone(String phone) {
    // Accepte formats simples (+33 ou 0X) avec espaces
    final digits = phone.replaceAll(RegExp(r'\s+'), '');
    final regex = RegExp(r'^(\+\d{8,15}|0\d{8,10})$');
    return regex.hasMatch(digits);
  }

  // Vérifie si l’étape Infos client comporte des champs invalides
  bool _isCustomerStepInvalid() {
    final nameEmpty = nameController.text.isEmpty;
    final emailText = emailController.text;
    final phoneText = phoneController.text;
    final emailInvalid = emailText.isEmpty || !_isValidEmail(emailText);
    final phoneInvalid = phoneText.isEmpty || !_isValidPhone(phoneText);
    return nameEmpty || emailInvalid || phoneInvalid;
  }

  // Vérifie si l’étape Livraison comporte des champs invalides
  bool _isShippingStepInvalid() {
    return addressController.text.isEmpty ||
        cityController.text.isEmpty ||
        zipController.text.isEmpty ||
        countryController.text.isEmpty;
  }

  // Indique si le bouton "Suivant" doit être désactivé pour l’étape courante
  bool isNextDisabledForCurrentStep(bool showErrors) {
    if (!showErrors) return false;
    if (_currentStep == 0) return _isCustomerStepInvalid();
    if (_currentStep == 1) return _isShippingStepInvalid();
    return false;
  }

  bool get _canGoNext {
    if (_currentStep == 0) {
      final nameOk = nameController.text.isNotEmpty;
      final emailOk = emailController.text.isNotEmpty && _isValidEmail(emailController.text);
      final phoneOk = phoneController.text.isNotEmpty && _isValidPhone(phoneController.text);
      return nameOk && emailOk && phoneOk;
    }
    if (_currentStep == 1) {
      return addressController.text.isNotEmpty &&
          cityController.text.isNotEmpty &&
          zipController.text.isNotEmpty &&
          countryController.text.isNotEmpty;
    }
    // Paiement/Confirmation: autoriser Next
    return true;
  }

  void _goNext() {
    if (_canGoNext) {
      setState(() {
        _showErrors = false;
        _currentStep = (_currentStep + 1).clamp(0, 3);
      });
    } else {
      // Active l’affichage des erreurs
      setState(() {
        _showErrors = true;
      });
    }
  }

  void _goPrev() {
    setState(() => _currentStep = (_currentStep - 1).clamp(0, 3));
  }

  void _goTo(int step) {
    setState(() => _currentStep = step.clamp(0, 3));
  }

  @override
  void dispose() {
    // Pas besoin de retirer les listeners explicitement, dispose() des contrôleurs nettoie
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Panier')),
      backgroundColor: const Color(0xFFF5F5F5),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Votre panier est vide'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Continuer mes achats'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Center(
              child: CartFormScope(
                nameController: nameController,
                emailController: emailController,
                phoneController: phoneController,
                addressController: addressController,
                cityController: cityController,
                zipController: zipController,
                countryController: countryController,
                showErrors: _showErrors,
                currentStep: _currentStep,
                isNextDisabledForCurrentStep: isNextDisabledForCurrentStep,
                isValidEmail: _isValidEmail,
                isValidPhone: _isValidPhone,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  margin: EdgeInsets.symmetric(
                    vertical: isDesktop ? 40 : 20,
                    horizontal: isDesktop ? 20 : 0,
                  ),
                  decoration: isDesktop
                      ? BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        )
                      : const BoxDecoration(color: Colors.white),
                  child: isDesktop
                      ? IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 3,
                                child: _PaymentColumn(
                                  state: state,
                                  currentStep: _currentStep,
                                  onStepTap: _goTo,
                                  onNext: _goNext,
                                  onPrev: _goPrev,
                                ),
                              ),
                              const VerticalDivider(
                                width: 1,
                                thickness: 1,
                                color: Color(0xFFEEEEEE),
                              ),
                              Expanded(
                                flex: 2,
                                child: _SummaryColumn(state: state),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            _PaymentColumn(
                              state: state,
                              currentStep: _currentStep,
                              onStepTap: _goTo,
                              onNext: _goNext,
                              onPrev: _goPrev,
                            ),
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0xFFEEEEEE),
                            ),
                            _SummaryColumn(state: state),
                          ],
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class _PaymentColumn extends StatelessWidget {
  final CartState state;
  final int currentStep;
  final void Function(int step) onStepTap;
  final VoidCallback onNext;
  final VoidCallback onPrev;
  const _PaymentColumn({
    required this.state,
    required this.currentStep,
    required this.onStepTap,
    required this.onNext,
    required this.onPrev,
  });

  @override
  Widget build(BuildContext context) {
    final scope = CartFormScope.of(context);
    final showErrors = scope.showErrors;

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CheckoutStepper(
            currentStep: currentStep,
            // Désactivation du clic pour éviter de sauter des étapes
            onStepTap: null,
          ),
          const SizedBox(height: 24),
          // Contenu conditionnel selon l’étape
          if (currentStep == 0) ...[
            Text(
              'Informations client',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const _CustomerInfoForm(),
          ] else if (currentStep == 1) ...[
            Text(
              'Adresse de livraison',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const _ShippingAddressForm(),
          ] else if (currentStep == 2) ...[
            Text(
              'Sélection du paiement',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 30),
            const _CreditCardForm(),
            const SizedBox(height: 24),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OU',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 24),
            const _PayPalSection(),
          ] else if (currentStep == 3) ...[
            Text(
              'Confirmation',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Merci pour votre commande ! Un e-mail de confirmation vous sera envoyé.',
            ),
          ],
          const SizedBox(height: 32),
          // Navigation des étapes
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: currentStep > 0 ? onPrev : null,
                icon: const Icon(LucideIcons.arrowLeft),
                label: const Text('Précédent'),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: scope.isNextDisabledForCurrentStep(showErrors)
                    ? null
                    : () {
                        // Si on est à l’étape de confirmation, vider le panier
                        if (currentStep == 3) {
                          final bloc = context.read<CartBloc>();
                          for (final item in state.items) {
                            bloc.add(CartRemove(item.productId));
                          }
                          // Optionnel: afficher une snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Commande confirmée, panier vidé.')),
                          );
                        }
                        onNext();
                      },
                icon: const Icon(LucideIcons.arrowRight),
                label: const Text('Suivant'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryColumn extends StatelessWidget {
  final CartState state;
  const _SummaryColumn({required this.state});

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'fr_FR', symbol: '€');
    return Container(
      color: const Color(0xFFFAFAFA),
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Résumé du panier',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '${state.items.length} articles',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ...state.items.map((item) => _CartItemTile(item: item)),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),
          _SummaryRow(
            label: 'Sous-total',
            value: currency.format(state.totalPrice),
          ),
          const _SummaryRow(label: 'Livraison', value: 'Gratuite'),
          const Spacer(),
          const Divider(thickness: 1),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                currency.format(state.totalPrice),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CheckoutStepper extends StatelessWidget {
  final int currentStep;
  final void Function(int step)? onStepTap;
  const _CheckoutStepper({required this.currentStep, this.onStepTap});

  @override
  Widget build(BuildContext context) {
    const steps = [
      '1. Infos client',
      '2. Livraison',
      '3. Paiement',
      '4. Confirmation',
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(steps.length, (index) {
            final isActive = index == currentStep;
            // Suppression de l’interaction tactile
            return Text(
              steps[index],
              style: TextStyle(
                color: isActive ? Colors.black : Colors.grey,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(height: 2, color: const Color(0xFFEEEEEE)),
            FractionallySizedBox(
              widthFactor: (currentStep + 1) / steps.length,
              child: Container(height: 2, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

class _CustomerInfoForm extends StatelessWidget {
  const _CustomerInfoForm();
  @override
  Widget build(BuildContext context) {
    final scope = CartFormScope.of(context);
    final showErrors = scope.showErrors;
    final emailText = scope.emailController.text;
    final phoneText = scope.phoneController.text;
    final emailInvalid = showErrors && (emailText.isEmpty || !scope.isValidEmail(emailText));
    final phoneInvalid = showErrors && (phoneText.isEmpty || !scope.isValidPhone(phoneText));
    final nameInvalid = showErrors && scope.nameController.text.isEmpty;
    return Column(
      children: [
        _InputField(
          label: 'NOM',
          hint: 'John Doe',
          controller: scope.nameController,
          isError: nameInvalid,
          errorText: 'Champ requis',
        ),
        const SizedBox(height: 12),
        _InputField(
          label: 'EMAIL',
          hint: 'john@doe.com',
          controller: scope.emailController,
          isError: emailInvalid,
          errorText: emailText.isEmpty ? 'Champ requis' : 'Email invalide',
        ),
        const SizedBox(height: 12),
        _InputField(
          label: 'TÉLÉPHONE',
          hint: '+33 6 12 34 56 78',
          controller: scope.phoneController,
          isError: phoneInvalid,
          errorText: phoneText.isEmpty ? 'Champ requis' : 'Téléphone invalide',
        ),
      ],
    );
  }
}

class _ShippingAddressForm extends StatelessWidget {
  const _ShippingAddressForm();
  @override
  Widget build(BuildContext context) {
    final scope = CartFormScope.of(context);
    final showErrors = scope.showErrors;
    final addrInvalid = showErrors && scope.addressController.text.isEmpty;
    final cityInvalid = showErrors && scope.cityController.text.isEmpty;
    final zipInvalid = showErrors && scope.zipController.text.isEmpty;
    final countryInvalid = showErrors && scope.countryController.text.isEmpty;
    return Column(
      children: [
        _InputField(
          label: 'ADRESSE',
          hint: '12 rue de la Paix',
          controller: scope.addressController,
          isError: addrInvalid,
          errorText: 'Champ requis',
        ),
        const SizedBox(height: 12),
        _InputField(
          label: 'VILLE',
          hint: 'Paris',
          controller: scope.cityController,
          isError: cityInvalid,
          errorText: 'Champ requis',
        ),
        const SizedBox(height: 12),
        _InputField(
          label: 'CODE POSTAL',
          hint: '75000',
          controller: scope.zipController,
          isError: zipInvalid,
          errorText: 'Champ requis',
        ),
        const SizedBox(height: 12),
        _InputField(
          label: 'PAYS',
          hint: 'France',
          controller: scope.countryController,
          isError: countryInvalid,
          errorText: 'Champ requis',
        ),
      ],
    );
  }
}

class _CreditCardForm extends StatelessWidget {
  const _CreditCardForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Carte bancaire',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png',
                  width: 30,
                ),
                const SizedBox(width: 8),
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/1280px-Mastercard-logo.svg.png',
                  width: 30,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        _InputField(
          label: 'NUMÉRO DE CARTE',
          hint: '1234 4321 4567 8901',
          suffixIcon: const Icon(Icons.check, color: Colors.green, size: 16),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CreditCardNumberFormatter(),
          ],
        ),
        const SizedBox(height: 20),
        const _InputField(label: 'NOM SUR LA CARTE', hint: 'Captain Falcon'),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _InputField(
                label: 'CODE CVV',
                hint: '...',
                helpIcon: true,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _InputField(
                label: 'DATE D’EXPIRATION (AA / MM)',
                hint: '12 / 1',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CreditCardExpiryFormatter(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PayPalSection extends StatelessWidget {
  const _PayPalSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('PayPal', style: TextStyle(fontWeight: FontWeight.bold)),
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/1200px-PayPal.svg.png',
              width: 60,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Vous serez redirigé vers le site PayPal pour finaliser votre paiement.',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Continuer vers le site PayPal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget? suffixIcon;
  final bool helpIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool isError;
  final String? errorText;

  const _InputField({
    required this.label,
    required this.hint,
    this.suffixIcon,
    this.helpIcon = false,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.isError = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (helpIcon) ...[
              const SizedBox(width: 4),
              const Icon(Icons.help_outline, size: 12, color: Colors.grey),
            ],
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: isError ? Colors.red : const Color(0xFFEEEEEE)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: isError ? Colors.red : const Color(0xFFEEEEEE)),
            ),
            errorText: isError ? (errorText ?? 'Champ requis') : null,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

class _CartItemTile extends StatelessWidget {
  final CartItem item;
  const _CartItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'fr_FR', symbol: '€');
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: (item.thumbnail != null && item.thumbnail!.isNotEmpty)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(item.thumbnail!, fit: BoxFit.cover),
                  )
                : const Icon(LucideIcons.image, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  currency.format(item.price),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _QuantityButton(
                      icon: LucideIcons.minus,
                      onPressed: () => context.read<CartBloc>().add(
                        CartDecrement(item.productId),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '${item.quantity}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _QuantityButton(
                      icon: LucideIcons.plus,
                      onPressed: () => context.read<CartBloc>().add(
                        CartIncrement(item.productId),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        LucideIcons.trash2,
                        size: 18,
                        color: Colors.red,
                      ),
                      onPressed: () => context.read<CartBloc>().add(
                        CartRemove(item.productId),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 14, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) return newValue;
    var text = newValue.text;
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class CreditCardExpiryFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) return newValue;
    var text = newValue.text;
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write(' / ');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
