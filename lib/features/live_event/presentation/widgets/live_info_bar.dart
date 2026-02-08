import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_number_flow/flutter_number_flow.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';
import 'package:test_flutter_bnj/features/live_event/data/datasources/mock_socket_service.dart';
import 'package:test_flutter_bnj/injection.dart';

class LiveInfoBar extends StatefulWidget {
  final LiveEvent event;

  const LiveInfoBar({
    super.key,
    required this.event,
  });

  @override
  State<LiveInfoBar> createState() => _LiveInfoBarState();
}

class _LiveInfoBarState extends State<LiveInfoBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _opacityAnimation;
  late final StreamController<int> _debouncedController;
  StreamSubscription<int>? _viewerSub;
  int _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
      lowerBound: 0.3,
      upperBound: 1.0,
    )..repeat(reverse: true);

    // Opacity suit le scale avec une courbe encore plus douce
    _opacityAnimation = CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOutCubic,
    );

    _debouncedController = StreamController<int>.broadcast();
    _subscribeViewerIfLive();
  }

  void _subscribeViewerIfLive() {
    _viewerSub?.cancel();
    _currentValue = 0;
    if (widget.event.status == LiveEventStatus.live) {
      _viewerSub = getIt<MockSocketService>().viewerCount.listen((count) {
        Future.delayed(const Duration(milliseconds: 250), () {
          if (!_debouncedController.isClosed) {
            _debouncedController.add(count);
          }
        });
      });
      _debouncedController.stream.listen((value) {
        if (mounted) {
          setState(() {
            _currentValue = value;
          });
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant LiveInfoBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.event.status != widget.event.status) {
      _subscribeViewerIfLive();
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _viewerSub?.cancel();
    _debouncedController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final event = widget.event;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: theme.dividerColor.withValues(alpha: 0.2)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  event.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Row(
            children: [
              FadeTransition(
                opacity: _opacityAnimation,
                child: ScaleTransition(
                  scale: _pulseController,
                  child: Icon(
                    event.status == LiveEventStatus.live
                        ? LucideIcons.circle
                        : LucideIcons.circleSlash,
                    color: event.status == LiveEventStatus.live
                        ? Colors.red
                        : theme.disabledColor,
                    size: 12,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                event.status == LiveEventStatus.live ? 'EN DIRECT' : 'HORS LIGNE',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: event.status == LiveEventStatus.live ? Colors.red : theme.disabledColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              if (event.status != LiveEventStatus.live)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: const [
                      Icon(LucideIcons.lockKeyhole, size: 12, color: Colors.orange),
                      SizedBox(width: 4),
                      Text('Lecture seule', style: TextStyle(fontSize: 10, color: Colors.orange)),
                    ],
                  ),
                ),
              const SizedBox(width: 16),
              if (event.status == LiveEventStatus.live) ...[
                const Icon(LucideIcons.eye, size: 16),
                const SizedBox(width: 6),
                NumberFlow(
                  value: _currentValue.toDouble(),
                  textStyle: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ) ?? const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ],
          )
        ],
      ),
    );
  }
}
