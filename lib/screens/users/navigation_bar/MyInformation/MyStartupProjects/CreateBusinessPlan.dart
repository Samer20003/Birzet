import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants.dart';
import 'BMCform.dart';

class CreateBusinessPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView( // Add SingleChildScrollView here
          child: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'إنشاء نموذج العمل التجاري',
                  style: GoogleFonts.cairo(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 16),
                _buildQuestionField(
                  context,
                  question: 'العملاء المستهدفون: من هم العملاء الذين تستهدفهم الشركة؟',
                ),
                _buildQuestionField(
                  context,
                  question: 'قيمة العرض: ما هي المنتجات أو الخدمات التي تقدمها الشركة وما القيمة التي تقدمها للعملاء؟',
                ),
                _buildQuestionField(
                  context,
                  question: 'قنوات التوزيع: كيف سيتم توصيل المنتجات أو الخدمات للعملاء؟',
                ),
                _buildQuestionField(
                  context,
                  question: 'علاقات العملاء: كيف ستتفاعل الشركة مع عملائها وتبني علاقات معهم؟',
                ),
                _buildQuestionField(
                  context,
                  question: 'مصادر الإيرادات: كيف ستكسب الشركة المال؟ (مثل المبيعات، الاشتراكات، الإعلانات)',
                ),
                _buildQuestionField(
                  context,
                  question: 'الموارد الرئيسية: ما هي الموارد الأساسية التي تحتاجها الشركة لتحقيق نموذج عملها؟',
                ),
                _buildQuestionField(
                  context,
                  question: 'الأنشطة الرئيسية: ما هي الأنشطة الأساسية التي يجب على الشركة القيام بها؟',
                ),
                _buildQuestionField(
                  context,
                  question: 'الشركاء الرئيسيون: من هم الشركاء أو الموردون الذين يساعدون الشركة في تحقيق أهدافها؟',
                ),
                _buildQuestionField(
                  context,
                  question: 'هيكل التكاليف: ما هي التكاليف المرتبطة بتشغيل نموذج العمل؟',
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Align buttons to the left
                  children: [
                    _buildCancelButton(context), // Cancel button
                    SizedBox(width: 16), // Add space between the buttons
                    _buildActionButton(context, label: 'تحويل الى خطة العمل', onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BMCformscreen()),
                      );
                    }),
                    SizedBox(width: 16), // Add space between the buttons
                    _buildSaveButton(context), // Save button
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionField(BuildContext context, {required String question}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            question,
            style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity, // Make the text field fill the available width
            height: 80,
            child: TextField(
              textAlign: TextAlign.right,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, {required String label, required VoidCallback onPressed}) {
    return Container(
      width: 220,
      height: 50,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return Container(
      width: 150,
      height: 50, // زيادة الارتفاع هنا
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back to the previous page
        },
        child: Text(
          'إلغاء',
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Container(
      width: 150,
      height: 50, // زيادة الارتفاع هنا

      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () {
          // Add your save logic here
        },
        child: Text(
          'حفظ',
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}