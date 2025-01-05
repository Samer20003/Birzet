import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatForInquiriesScreen extends StatefulWidget {
  const ChatForInquiriesScreen({super.key});

  @override
  _ChatForInquiriesScreenState createState() => _ChatForInquiriesScreenState();
}

class _ChatForInquiriesScreenState extends State<ChatForInquiriesScreen> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _messageController = TextEditingController();
  bool _isChatVisible = true; // اجعل الشات مرئيًا بشكل افتراضي

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      final String messageText = _messageController.text;
      final String timeStamp = DateFormat('HH:mm').format(DateTime.now());

      setState(() {
        messages.add({
          'sender': 'user',
          'message': messageText,
          'time': timeStamp,
        });
        _messageController.clear();
      });
    }
  }

  void _toggleChatVisibility() {
    setState(() {
      _isChatVisible = !_isChatVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isChatVisible ? _buildChatWidget() : Container(); // عرض الشات مباشرة
  }

  Widget _buildChatWidget() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1D47),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isUserMessage = message['sender'] == 'user';

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: isUserMessage ? Colors.orange : Colors.blueAccent,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.all(12.0),
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                            child: Column(
                              crossAxisAlignment: isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message['message'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.start,
                                  maxLines: null,
                                  overflow: TextOverflow.visible,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  message['time'] ?? '',
                                  style: TextStyle(fontSize: 12, color: Colors.grey[200]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                color: Color(0xFF0A1D47),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: "أدخل رسالتك",
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        maxLines: null,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}