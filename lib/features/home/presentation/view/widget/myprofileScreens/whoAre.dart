import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/components.dart';

class Whoare extends StatelessWidget {
  const Whoare({super.key});
static const routeName = 'whoare';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: 'من نحن'),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Text(
              sampleText,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
                height: 1.8, // تباعد بين السطور مثل الصورة
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
    const String sampleText = '''
هناك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم،
ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو
الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص
لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي
كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص.

هناك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم،
ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو
الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص
لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي
كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص.

هناك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم،
ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو
الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص
لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي
كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص.
''';
