import 'package:flutter/material.dart';
import 'package:june/Services/agent_service.dart';
import 'package:june/Widgets/AI/ai_bubble.dart';
import 'package:june/Widgets/AI/input_bar.dart';
import 'package:june/Widgets/AI/typing_indicator.dart';
import 'package:june/Widgets/AI/user_bubble.dart';
import 'package:june/Widgets/Theme/my_theme.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final List<AgentMessage> _messages = [];
  final TextEditingController _textCtrl = TextEditingController();
  final ScrollController _scrollCtrl = ScrollController();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _loadGreeting();
  }

  @override
  void dispose() {
    _textCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadGreeting() async {
    setState(() => _isTyping = true);
    try {
      final reply = await AgentService.chat([]);
      if (!mounted) return;
      setState(() {
        _messages.add(AgentMessage(role: 'assistant', content: reply));
        _isTyping = false;
      });
      _scrollToBottom();
    } catch (e) {
      if (!mounted) return;
      setState(() => _isTyping = false);
      _showError(e.toString());
    }
  }

  Future<void> _send() async {
    final text = _textCtrl.text.trim();
    if (text.isEmpty || _isTyping) return;

    _textCtrl.clear();
    setState(() {
      _messages.add(AgentMessage(role: 'user', content: text));
      _isTyping = true;
    });
    _scrollToBottom();

    try {
      final reply = await AgentService.chat(List.from(_messages));
      if (!mounted) return;
      setState(() {
        _messages.add(AgentMessage(role: 'assistant', content: reply));
        _isTyping = false;
      });
      _scrollToBottom();
    } catch (e) {
      if (!mounted) return;
      setState(() => _isTyping = false);
      _showError(e.toString());
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          _scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.surfaceColor,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: StretchingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                child: ListView.separated(
                  controller: _scrollCtrl,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  padding: const EdgeInsets.fromLTRB(
                    MyTheme.spaceMd,
                    MyTheme.spaceMd,
                    MyTheme.spaceMd,
                    MyTheme.spaceSm,
                  ),
                  itemCount: _messages.length + (_isTyping ? 1 : 0),
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: MyTheme.spaceLg),
                  itemBuilder: (context, i) {
                    if (i < _messages.length) {
                      final msg = _messages[i];
                      return msg.role == 'user'
                          ? UserBubble(message: msg)
                          : AiBubble(message: msg);
                    }
                    return const TypingIndicator();
                  },
                ),
              ),
            ),
            InputBar(
              controller: _textCtrl,
              onSend: _send,
              enabled: !_isTyping,
            ),
          ],
        ),
      ),
    );
  }
}
