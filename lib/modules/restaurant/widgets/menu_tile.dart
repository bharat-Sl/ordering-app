import 'package:flutter/material.dart';
import 'package:ordering/modules/restaurant/widgets/item_tile.dart';

class MenuTile extends StatefulWidget {
  const MenuTile({super.key});

  @override
  State<MenuTile> createState() => _MenuTileState();
}

class _MenuTileState extends State<MenuTile> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: ThemeData().copyWith(
            dividerColor: const Color(0xffeeeeee),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          child: ExpansionTile(
              initiallyExpanded: expanded,
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              title: const Text(
                "Veg Pizza",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0),
              ),
              shape: const Border(),
              onExpansionChanged: ((newState) {
                if (newState) {
                  setState(() {
                    expanded = true;
                  });
                } else {
                  setState(() {
                    expanded = false;
                  });
                }
              }),
              children: [
                ...List.generate(
                  3,
                  (index) => const ItemTile(),
                ),
              ]),
        ),
        Container(
          width: double.maxFinite,
          height: 6,
          color: const Color(0xffeeeeee),
        ),
      ],
    );
  }
}
