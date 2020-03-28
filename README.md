# sweetsheet
Show beautiful bottom sheet as confirmation dialog quickly and easily.

| nice        | warning       |
|:-------------:|:------------------:|
| ![nice](https://github.com/CorneilleEdi/sweetsheet/raw/master/assets/nice_sheet.jpg)        | ![warning](https://github.com/CorneilleEdi/sweetsheet/raw/master/assets/warning_sheet.jpg) |


| success        | danger       |
|:-------------:|:------------------:|
| ![success](https://github.com/CorneilleEdi/sweetsheet/raw/master/assets/success.jpg)        | ![danger](https://github.com/CorneilleEdi/sweetsheet/raw/master/assets/danger.jpg) |

and since version `0.2.0` , it is fully customisable.

| custom dark        | custom light       |
|:-------------:|:------------------:|
| ![success](https://github.com/CorneilleEdi/sweetsheet/raw/master/assets/black.jpg)        | ![danger](https://github.com/CorneilleEdi/sweetsheet/raw/master/assets/light.jpg) |


## Getting Started

With increasingly large smartphones, it has become almost impossible to have good ergonomics in an application using confirmation dialogs. 
The SweetSheet package allows you to show beautiful bottoms sheets to replace your confirmation dialogs and maintain a good user experience.

## How to use?

Add this to your package's pubspec.yaml file:

```
dependencies:
  sweetsheet: ^0.2.0
```

And import it:
```dart
import 'package:sweetsheet/sweetsheet.dart';
```

to start using the sheets, you have to create the instance of the 
`SweetSheet` class first.

```dart
final SweetSheet _sweetSheet = SweetSheet();
```

Now you can show the bottom sheet by calling the method `show()` on the instance.
This is the signature of the `show` method

```dart
 show({
    @required BuildContext context,
    Text title,
    @required Text description,
    @required CustomSheetColor color,
    @required SweetSheetAction positive,
    SweetSheetAction negative,
    IconData icon,
  }){}
```

This is the signature of the `SweetSheetAction` widget.

```dart
class SweetSheetAction extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;

  SweetSheetAction({
    @required this.title,
    @required this.onPressed,
    this.icon,
    this.color = Colors.white,
  });  
}
```

> Attention : At least one action is required and the icons are IconData for uniformity purpose.


The `SweetSheetType` is an class which have four static values and it determine the color of the sheet:

- SweetSheetColor.SUCCESS (green)
- SweetSheetColor.DANGER (red)
- SweetSheetColor.WARNING (orange)
- SweetSheetColor.NICE (blue)

## Example:

#### Warning

```dart
_sweetSheet.show(
    context: context,
    title: Text("Attention"),
    description: Text(
        'Your app is not connected to internet actually, please turn on Wifi/Celullar data.'),
    color: SweetSheetColor.WARNING,
    icon: Icons.portable_wifi_off,
    positive: SweetSheetAction(
      onPressed: () {
        Navigator.of(context).pop();
      },
      title: 'OPEN SETTING',
      icon: Icons.open_in_new,
    ),
    negative: SweetSheetAction(
      onPressed: () {
        Navigator.of(context).pop();
      },
      title: 'CANCEL',
    ),
);
```

#### Custom Light

```dart
_sweetSheet.show(
    context: context,
    description: Text(
      'Place your order. Please confirm the placement of your order : Iphone X 128GB',
      style: TextStyle(color: Color(0xff2D3748)),
    ),
    color: CustomSheetColor(
      main: Colors.white,
      accent: Color(0xff5A67D8),
      icon: Color(0xff5A67D8),
    ),
    icon: Icons.local_shipping,
    positive: SweetSheetAction(
      onPressed: () {
        Navigator.of(context).pop();
      },
      title: 'CONTINUE',
    ),
    negative: SweetSheetAction(
      onPressed: () {
        Navigator.of(context).pop();
      },
      title: 'CANCEL',
  ),
);
```

### That is all. Have fun!
