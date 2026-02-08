import 'package:flutter/material.dart';
import 'package:test_flutter_bnj/widgets/common/app_button.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.circleAlert, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(message, textAlign: TextAlign.center),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            AppButton(label: 'Réessayer', onPressed: onRetry),
          ],
        ],
      ),
    );
  }
}
