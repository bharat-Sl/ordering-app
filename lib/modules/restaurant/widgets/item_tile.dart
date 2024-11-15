import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ordering/modules/restaurant/widgets/item_detail_bottom_sheet.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({super.key});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  int count = 0;
  bool customize = false;

  @override
  void initState() {
    super.initState();
    customize = Random().nextBool();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffdddddd)),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://shwetainthekitchen.com/wp-content/uploads/2023/08/Tandoori-Paneer-Naan-Pizza.jpg"),
                      fit: BoxFit.cover),
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
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tandoori Paneer",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "It's our signature Spiced Paneer, Crunchy Onions & Green Capsicum, spicy Red Paprika with delicious Tandoori Sauce and 100% mozzarella cheese.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text(
                        "Rs. 200",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (count == 0)
                      GestureDetector(
                        onTap: () {
                          if (customize) {
                            ItemDetailBottomSheet.show(context);
                          } else {
                            setState(() {
                              count += 1;
                            });
                          }
                        },
                        child: Container(
                          width: 90,
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 1)
                              ],
                              border:
                                  Border.all(color: const Color(0xffdddddd)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    else
                      Container(
                        width: 90,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 1)
                            ],
                            border: Border.all(color: const Color(0xffdddddd)),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  count -= 1;
                                });
                              },
                              child: Icon(
                                count < 2 ? Icons.remove : Icons.remove,
                                size: 18,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  count.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.8),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  count += 1;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                if (customize)
                  const Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 90,
                      child: Center(
                        child: Text(
                          "customize",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
