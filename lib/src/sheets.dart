import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSheetColor {
  Color mainColor;
  Color accentColor;
  Color iconColor;

  CustomSheetColor(
      {required this.mainColor, required this.accentColor, required this.iconColor});
}

class SweetSheetColor {
  static CustomSheetColor DANGER = CustomSheetColor(
    mainColor: Color(0xffEF5350),
    accentColor: Color(0xffD32F2F),
    iconColor: Colors.white,
  );
  static CustomSheetColor SUCCESS = CustomSheetColor(
    mainColor: Color(0xff009688),
    accentColor: Color(0xff00695C),
    iconColor: Colors.white,
  );
  static CustomSheetColor WARNING = CustomSheetColor(
    mainColor: Color(0xffFF8C00),
    accentColor: Color(0xffF55932),
    iconColor: Colors.white,
  );
  static CustomSheetColor NICE = CustomSheetColor(
    mainColor: Color(0xff2979FF),
    accentColor: Color(0xff0D47A1),
    iconColor: Colors.white,
  );
}

class SweetSheet {
  show({
    required BuildContext context,
    Text? title,
    required Text description,
    required CustomSheetColor color,
    required SweetSheetAction positive,
    EdgeInsets? contentPadding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
    EdgeInsets? actionPadding = const EdgeInsets.all(8.0),
    SweetSheetAction? negative,
    IconData? icon,
    ///For User's Custom Widget
    Widget? custom,
    double iconSize = 52,
    double titleFontSize = 24,

    double descriptionFontSize = 18,
    String fontFamily = 'circular',
    bool useRootNavigator = false,
    bool isDismissible = true,
    double radiusTopLeft = 10,
    double radiusTopRight = 10,
    double radiusBottomLeft = 0,
    double radiusBottomRight = 0,
  }) {
    showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radiusTopLeft),
              topRight: Radius.circular(radiusTopRight),
              bottomLeft: Radius.circular(radiusBottomLeft),
              bottomRight: Radius.circular(radiusBottomRight),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: double.infinity,
                color: color.mainColor,
                padding: contentPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    title == null
                        ? Container()
                        : DefaultTextStyle(
                        style: TextStyle(
                          fontSize: titleFontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontFamily,
                        ),
                        textAlign: TextAlign.start,
                        child: title),
                    _buildContent(color, description, icon,fontFamily,descriptionFontSize,iconSize),
                    custom??SizedBox.shrink(),
                  ],
                ),
              ),
              Container(
                padding: actionPadding,
                color: color.accentColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _buildActions(positive, negative),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _buildContent(CustomSheetColor color, Text description, IconData? icon,String fontFamily, double descriptionFontSize,double iconSize) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SingleChildScrollView(
        child: icon != null
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: DefaultTextStyle(
                  style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.white,
                      fontFamily: fontFamily),
                  child: description),
            ),
            SizedBox(
              width: 16,
            ),
            Icon(
              icon,
              size: iconSize,
              color: color.iconColor,
            )
          ],
        )
            : DefaultTextStyle(
          style: TextStyle(
            fontSize: descriptionFontSize,
            fontFamily: fontFamily,
            color: Colors.white,
          ),
          child: description,
        ),
      ),
    );
  }

  _buildActions(SweetSheetAction? positive, SweetSheetAction? negative) {
    List<SweetSheetAction> actions = [];

    // This order is important
    // It helps to place the positive at the right and the negative before
    if (negative != null) {
      actions.add(negative);
    }

    if (positive != null) {
      actions.add(positive);
    }

    return actions;
  }
}

class SweetSheetAction extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color color;
  VoidCallback? onLongPress;

  SweetSheetAction({
    required this.title,
    required this.onPressed,
    this.onLongPress,
    this.icon,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? TextButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Text(
        title,
        style: TextStyle(
          color: color,
        ),
      ),
    )
        : TextButton.icon(
      onPressed: onPressed,
      onLongPress: onLongPress,
      label: Text(
        title,
        style: TextStyle(
          color: color,
        ),
      ),
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
