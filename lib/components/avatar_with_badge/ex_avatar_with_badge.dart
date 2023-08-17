import 'package:ex_widget/extensions/text.extension.dart';
import 'package:flutter/material.dart';

class ExAvatarWithBadge extends StatefulWidget {
  final double? avatarRadius;
  final double? badgeRadius;
  final Widget badge;
  final Widget avatar;
  final VoidCallback onTap;
  const ExAvatarWithBadge({
    super.key,
    this.avatarRadius = 50,
    this.badgeRadius = 15,
    required this.badge,
    required this.avatar,
    required this.onTap,
  });

  @override
  State<ExAvatarWithBadge> createState() => _ExAvatarWithBadgeState();
}

class _ExAvatarWithBadgeState extends State<ExAvatarWithBadge> {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: widget.avatarRadius,
              backgroundColor: Colors.white,
              child: widget.avatar,
            ),
            Positioned(
              right: widget.badgeRadius! / -3,
              bottom: 0,
              child: CircleAvatar(
                radius: widget.badgeRadius,
                child: widget.avatar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
