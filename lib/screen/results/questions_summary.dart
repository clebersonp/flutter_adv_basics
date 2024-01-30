import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/screen/results/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) => SummaryItem(data)).toList(),
        ),
      ),
    );
  }
}
