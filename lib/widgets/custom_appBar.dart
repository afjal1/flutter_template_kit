import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:template_kit/help/colors.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBarAtt(
  BuildContext context, {
  String? title,
  bool centerTitle = true,
  bool enableLeading = true,
  List<Widget>? actions,
  void Function()? leadingOntap,
  PreferredSizeWidget? bottom,
  Color? backgroundColor,
  Color? leadingIconColor,
  Color? titleColor,
}) {
  final theme = Theme.of(context);
  return AppBar(
    backgroundColor:
        (backgroundColor == null) ? theme.backgroundColor : backgroundColor,
    centerTitle: centerTitle,
    leading: enableLeading
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (leadingOntap == null) ? buildBackOnTap : leadingOntap,
            color: leadingIconColor ?? theme.primaryColor,
          )
        : const SizedBox(),
    title: Text(
      title ?? '',
      style: theme.textTheme.headline3?.copyWith(
        color: titleColor,
      ),
    ),
    actions: actions,
    bottom: bottom,
  );
}

void buildBackOnTap() {
  Get.back<dynamic>();
}

class CustomAppBar extends StatelessWidget {
  final VoidCallback onChatTap;
  final VoidCallback onSearchTap;

  const CustomAppBar({
    Key? key,
    required this.onChatTap,
    required this.onSearchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 70,
      left: 0,
      right: 0,
      top: 0,
      child: CustomAppBarAtt(
        context,
        title: 'HomePage',
        enableLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.search),
            color: ColorLight.fontTitle,
            //   tooltip: AppLocalizations.of(context)!.search,
            onPressed: onSearchTap,
          ),
        ],
      ),
    );
  }
}
