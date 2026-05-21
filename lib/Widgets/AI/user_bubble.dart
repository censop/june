import 'package:flutter/material.dart';
import 'package:june/Services/agent_service.dart';
import 'package:june/Widgets/Theme/my_theme.dart';

class UserBubble extends StatelessWidget {
  final AgentMessage message;
  const UserBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.72,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: MyTheme.spaceMd,
          vertical: MyTheme.spaceSm + 4,
        ),
        decoration: const BoxDecoration(
          color: MyTheme.surfaceContainerColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MyTheme.radiusLg),
            topRight: Radius.circular(MyTheme.radiusLg),
            bottomLeft: Radius.circular(MyTheme.radiusLg),
            bottomRight: Radius.circular(MyTheme.radiusSm),
          ),
        ),
        child: Text(
          message.content,
          style: tt.bodyMedium?.copyWith(color: MyTheme.onSurfaceColor),
        ),
      ),
    );
  }
}
