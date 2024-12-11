import 'package:flutter/material.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  _AIChatScreenState createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = []; // استخدام Map لتحديد نوع الرسالة

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({"text": _messageController.text, "type": "user"}); // إضافة رسالة المستخدم
        _messages.add({"text": "هذه رد من الذكاء الاصطناعي", "type": "ai"}); // إضافة رد افتراضي من الذكاء الاصطناعي
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AI اسأل ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0A1D47),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUserMessage = message["type"] == "user"; // تحديد نوع الرسالة

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isUserMessage ? Colors.orange : Colors.grey[300], // تحديد اللون بناءً على نوع الرسالة
                          borderRadius: BorderRadius.circular(8.0), // زوايا مستديرة
                        ),
                        padding: EdgeInsets.all(12.0), // مساحة داخلية للمستطيل
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75), // تحديد العرض الأقصى للمستطيل
                        child: Text(
                          message["text"]!,
                          style: TextStyle(color: Colors.black), // لون النص
                          textAlign: TextAlign.start, // محاذاة النص
                          maxLines: null, // السماح للنص بالانتقال إلى أسطر متعددة
                          overflow: TextOverflow.visible, // نص يظهر على عدة أسطر
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
                    maxLines: null, // السماح بإدخال نص متعدد الأسطر
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
    );
  }
}