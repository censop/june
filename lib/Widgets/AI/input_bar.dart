import 'package:flutter/material.dart';
import 'package:june/Widgets/Theme/my_theme.dart';

class InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final bool enabled;

  const InputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        MyTheme.spaceMd,
        MyTheme.spaceSm,
        MyTheme.spaceMd,
        MyTheme.spaceMd,
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: MyTheme.spaceMd,
              right: 52,
              top: MyTheme.spaceSm + 4,
              bottom: MyTheme.spaceSm + 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MyTheme.radiusXl),
              border: Border.all(
                color: MyTheme.outlineVariantColor.withValues(alpha: 0.6),
              ),
            ),
            child: TextField(
              controller: controller,
              enabled: enabled,
              style: tt.bodyMedium?.copyWith(color: MyTheme.onSurfaceColor),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => onSend(),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Message june...',
                hintStyle: tt.bodyMedium?.copyWith(color: MyTheme.outlineColor),
              ),
            ),
          ),
          Positioned(
            right: 8,
            child: GestureDetector(
              onTap: enabled ? onSend : null,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: enabled
                      ? MyTheme.primaryColor
                      : MyTheme.outlineVariantColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
