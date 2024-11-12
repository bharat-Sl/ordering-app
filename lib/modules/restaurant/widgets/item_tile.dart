import 'package:flutter/material.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({super.key});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.green, width: 2)),
                  child: Center(
                      child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: Colors.green),
                  )),
                ),
              )
            ],
          ),
          SizedBox(width: 8),
          Column(
            children: [
              Text(
                "Tandoori Paneer",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
