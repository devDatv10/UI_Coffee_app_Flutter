import 'package:flutter/material.dart';

class ExpandableDescription extends StatefulWidget {
  final String initialDescription;
  const ExpandableDescription({super.key, required this.initialDescription});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final descriptionLines = widget.initialDescription.split('\.')[0];
    final shortenedDescription =
        isExpanded ? widget.initialDescription : descriptionLines;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          shortenedDescription,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey[300],
            height: 2,
          ),
        ),
        if (descriptionLines.length > 2)
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? "Read less" : "... more",
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
          ),
      ],
    );
  }
}
