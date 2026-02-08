import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:test_flutter_bnj/core/utils/extensions.dart';
import 'package:test_flutter_bnj/features/live_event/domain/entities/live_event.dart';

class LiveNowCardItem extends StatelessWidget {
  final LiveEvent event;
  const LiveNowCardItem({
    required this.event,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(12),
                    child: Image.network(
                      event.thumbnailUrl ?? '',
                      errorBuilder:
                          (
                          context,
                          error,
                          stackTrace,
                          ) => const Icon(
                        LucideIcons.imageMinus,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                      BorderRadius.circular(4),
                    ),
                    child: Text("LIVE"),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius:
                      BorderRadius.circular(4),
                    ),
                    child: Text(
                      event.startTime
                          .toLiveEventTimeString(),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius:
                      BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          LucideIcons.eye,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const Gap(4),
                        Text(
                          "${event.viewerCount}",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    Icon(
                      LucideIcons.user,
                      size: 16,
                      color: colorScheme.secondary,
                    ),
                    const Gap(4),
                    Flexible(
                      child: Text(
                        event.seller.name,
                        style: textTheme.bodyMedium
                            ?.copyWith(
                          color: colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}