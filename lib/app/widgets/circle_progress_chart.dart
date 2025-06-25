import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ChartSegment {
  final String name;
  final double value;
  final Color color;

  ChartSegment({
    required this.name,
    required this.value,
    required this.color,
  });
}

class CircleProgressChart extends StatefulWidget {
  final List<ChartSegment>? segments;
  final double percentage;
  final String centerText;
  final String subtitle;
  final Color color;
  final double size;
  final double total;

  const CircleProgressChart({
    Key? key,
    this.segments,
    required this.percentage,
    required this.centerText,
    required this.subtitle,
    required this.color,
    this.size = 150,
    this.total = 100,
  }) : super(key: key);

  @override
  State<CircleProgressChart> createState() => _CircleProgressChartState();
}

class _CircleProgressChartState extends State<CircleProgressChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: widget.size,
        minHeight: widget.size,
        maxHeight: widget.size + 60,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    startDegreeOffset: 270,
                    centerSpaceRadius: widget.size * 0.23,
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    sections: _buildSegments(),
                  ),
                ),
                Center(
                  child: Text(
                    widget.centerText,
                    style: TextStyle(
                      fontSize: widget.size * 0.16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // if (widget.segments != null) ..._buildSegmentLabels(),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildSegments() {
    final List<PieChartSectionData> sections = [];

    if (widget.segments != null) {
      for (var i = 0; i < widget.segments!.length; i++) {
        final segment = widget.segments![i];
        final isTouched = i == touchedIndex;
        final radius = isTouched ? widget.size * 0.3 : widget.size * 0.25;

        sections.add(
          PieChartSectionData(
            value: (segment.value / widget.total) * 100,
            color: segment.color,
            radius: radius,
            title: segment.name, //\n${segment.value.toInt()}',
            titleStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black45,
              shadows: [
                Shadow(color: Colors.black26, blurRadius: 2),
              ],
            ),
          ),
        );
      }
    } else {
      sections.add(
        PieChartSectionData(
          value: 100 - widget.percentage,
          color: Colors.grey.withOpacity(0.1),
          radius: widget.size * 0.25,
          showTitle: false,
        ),
      );
      sections.add(
        PieChartSectionData(
          value: widget.percentage,
          color: widget.color.withOpacity(0.9),
          radius: widget.size * 0.25,
          showTitle: false,
        ),
      );
    }
    return sections;
  }

  List<Widget> _buildSegmentLabels() {
    final List<Widget> labels = [];
    double startAngle = -90 * (math.pi / 180);

    for (var segment in widget.segments!) {
      final segmentPercentage = segment.value / widget.total;
      final sweepAngle = 360 * segmentPercentage * (math.pi / 180);
      final midAngle = startAngle + (sweepAngle / 2);

      final radius = widget.size * 0.33;
      final x = widget.size / 2 + radius * math.cos(midAngle);
      final y = widget.size / 2 + radius * math.sin(midAngle);

      labels.add(
        Positioned(
          left: x - 8,
          top: y - 10,
          child: Text(
            segment.name,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );

      startAngle += sweepAngle;
    }

    return labels;
  }
}
