extension LiveEventTimeExtension on DateTime {
  String toLiveEventTimeString() {
    final now = DateTime.now();
    final difference = this.difference(now);

    if (difference.inSeconds < 0) {
      final elapsed = now.difference(this);
      if (elapsed.inMinutes < 1) {
        return 'Live (started just now)';
      } else if (elapsed.inHours < 1) {
        return '${elapsed.inMinutes} min';
      } else if (elapsed.inDays < 1) {
        return '${elapsed.inHours} h';
      } else {
        return 'Live (started ${elapsed.inDays} days ago)';
      }
    } else if (difference.inMinutes < 1) {
      return 'Starting soon';
    } else if (difference.inHours < 1) {
      return 'Starting in ${difference.inMinutes} minutes';
    } else if (difference.inDays < 1) {
      return 'Starting in ${difference.inHours} hours';
    } else {
      return 'Starting in ${difference.inDays} days';
    }
  }
}