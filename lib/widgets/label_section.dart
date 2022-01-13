import 'package:flutter/material.dart';
import 'package:template_kit/help/constants.dart';

class BuildLabelSection extends StatelessWidget {
  const BuildLabelSection({
    Key? key,
    required this.label,
    required this.onViewAllTap,
  }) : super(key: key);

  final String label;
  final VoidCallback onViewAllTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                  fontSize: 20)),
          InkWell(
            onTap: onViewAllTap,
            borderRadius: BorderRadius.circular(15),
            child: Text('View All', style: theme.textTheme.subtitle1),
          ),
        ],
      ),
    );
  }
}
