/*************  ✨ Codeium Command 🌟  *************/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/utils/app_text_style.dart';

class ChooseExperienceWidget extends StatefulWidget {
  const ChooseExperienceWidget({super.key});

  @override
  State<ChooseExperienceWidget> createState() => _ChooseExperienceWidgetState();
}

class _ChooseExperienceWidgetState extends State<ChooseExperienceWidget> {
  final List<String> experienceLevels = [
    'Fresh',
    'Junior',
    'MidLevel',
    'Senior'
  ];

  String? selectedLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      height: 45.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: DropdownButton<String>(
        value: selectedLevel,
        hint: Text(
          'Choose experience Level',
          style: AppTextStyle.textStyle12CP,
        ),
        isExpanded: true,
        underline: SizedBox(),
        icon: Icon(Icons.arrow_drop_down),
        items: experienceLevels.map((String level) {
          return DropdownMenuItem<String>(
            value: level,
            child: Text(level),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedLevel = newValue;
          });
        },
      ),
    );
  }
}

/******  37668e78-4d29-49da-b54e-473a6c005acb  *******/