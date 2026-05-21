import 'package:flutter/material.dart';
import 'package:june/Services/agent_service.dart';
import 'package:june/Widgets/AI/bot_avatar.dart';
import 'package:june/Widgets/Theme/my_theme.dart';

class AiBubble extends StatelessWidget {
  final AgentMessage message;
  const AiBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BotAvatar(),
        const SizedBox(width: MyTheme.spaceSm + 4),
        Expanded(
          child: Card(
            color: Colors.white,
            elevation: 0.7,
            shadowColor: MyTheme.primaryColor.withValues(alpha: 0.10),
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(MyTheme.radiusSm),
                topRight: Radius.circular(MyTheme.radiusLg),
                bottomLeft: Radius.circular(MyTheme.radiusLg),
                bottomRight: Radius.circular(MyTheme.radiusLg),
              ),
              side: BorderSide(
                color: MyTheme.outlineVariantColor.withValues(alpha: 0.4),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(MyTheme.spaceMd),
              child: Text(
                message.content,
                style: tt.bodyMedium?.copyWith(
                  color: MyTheme.primaryColor,
                  height: 1.6,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
