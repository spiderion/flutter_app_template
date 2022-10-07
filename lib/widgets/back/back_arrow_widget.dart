import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/constants/material_constants/material_constants.dart';

class BackArrowWidget extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  final IconData? customIcon;
  final double? size;

  const BackArrowWidget({Key? key, this.onTap, this.color, this.customIcon, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) => _iconBackArrow(context);

  Widget _iconBackArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: MaterialConstants.DEFAULT_MARGIN_LEFT_MINOR),
      child: IconButton(
        icon: Icon(customIcon ?? Icons.arrow_back_ios,
            color: color ?? Theme.of(context).appBarTheme.titleTextStyle?.color,
            size: size ?? MaterialConstants.BACK_ARROW_ICON_SIZE),
        onPressed: onTap == null ? () => Navigator.of(context).pop() : onTap,
      ),
    );
  }
}
