import 'package:flutter/material.dart';

class SweetSheet {
  List<Color> sheetColor(SweetSheetType type) {
    switch (type) {
      case SweetSheetType.NICE:
        return [Color(0xff2979FF), Color(0xff0D47A1)];
        break;
      case SweetSheetType.SUCCESS:
        return [Color(0xff009688), Color(0xff00695C)];
        break;
      case SweetSheetType.WARNING:
        return [Color(0xffFF8C00), Color(0xffF55932)];
        break;
      case SweetSheetType.DANGER:
        return [Color(0xffEF5350), Color(0xffD32F2F)];
        break;
      default:
        return [Color(0xff2979FF), Color(0xff0D47A1)];
    }
  }

  show({
    @required BuildContext context,
    @required String title,
    @required String description,
    @required SweetSheetType type,
    @required SweetSheetAction positive,
    SweetSheetAction negative,
    IconData icon,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: sheetColor(type)[0],
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 28,color: Colors.white,),
                    textAlign: TextAlign.start,
                  ),
                  _buildContent(description, icon)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: sheetColor(type)[1],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _buildActions(positive, negative),
              ),
            )
          ],
        );
      },
    );
  }

  _buildContent(String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SingleChildScrollView(
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Icon(
                    icon,
                    size: 52,
                    color: Colors.white,
                  )
                ],
              )
            : Text(
                description,
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
      ),
    );
  }

  _buildActions(SweetSheetAction positive, SweetSheetAction negative) {
    List<SweetSheetAction> actions = [];

    if (positive != null) {
      actions.add(positive);
    }

    if (negative != null) {
      actions.add(negative);
    }
    return actions;
  }
}

enum SweetSheetType { SUCCESS, DANGER, NICE, WARNING }

class SweetSheetAction extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;

  SweetSheetAction({@required this.title, @required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? FlatButton(
            onPressed: onPressed,
            child: Text(title,style: TextStyle(color: Colors.white),),
          )
        : FlatButton.icon(
            onPressed: onPressed,
            label: Text(title),
            icon: Icon(icon,color: Colors.white,),
          );
  }
}
