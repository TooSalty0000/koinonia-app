import 'package:flutter/material.dart';
import '../presentation/app_icons.dart';

class QuickAccess extends StatelessWidget {
  const QuickAccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.secondary,
        ),
        padding: const EdgeInsets.all(10),
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QuickAccessButton(
                icon: Icons.note_alt_rounded,
                buttonName: "QT",
              ),
              QuickAccessButton(
                icon: KoinoniaIcons.praying_hands,
                buttonName: "Prayers",
                offsetX: 10,
                offsetY: 5,
                size: 40,
              ),
              QuickAccessButton(
                icon: Icons.menu_book,
                buttonName: "Bible Reading",
              )
            ]));
  }
}

class QuickAccessButton extends StatelessWidget {
  const QuickAccessButton(
      {Key? key,
      required this.icon,
      this.buttonName = "Button",
      this.offsetX = 0,
      this.offsetY = 0,
      this.size = 50})
      : super(key: key);
  final String buttonName;
  final IconData icon;
  final double offsetX;
  final double offsetY;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () => {print("Pressed")},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.secondary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(const Size(110, 110)),
        ),
        child: Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  buttonName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, offsetX, offsetY),
                  child: Icon(
                    icon,
                    size: size,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
