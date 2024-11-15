import 'package:flutter/material.dart';

class ItemDetailBottomSheet {
  static show(context) async {
    await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        builder: (context) {
          return ItemDetailView();
        });
  }
}

class ItemDetailView extends StatefulWidget {
  const ItemDetailView({super.key});

  @override
  State<ItemDetailView> createState() => _ItemDetailViewState();
}

class _ItemDetailViewState extends State<ItemDetailView> {
  final scrollController = ScrollController();
  ScrollPhysics _physics = ScrollPhysics();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset < 0) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        minHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 14 / 9,
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color(0xffdddddd),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.green, width: 2)),
                      child: Center(
                          child: Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: Colors.green),
                      )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tandoori Paneer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "It's our signature Spiced Paneer, Crunchy Onions & Green Capsicum, spicy Red Paprika with delicious Tandoori Sauce and 100% mozzarella cheese.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 6,
              color: const Color(0xffeeeeee),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xffeeeeee),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Variation 1",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Select up to 1 option",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...[1, 2, 3, 4].map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Fresh Pan(Per)",
                                    style: TextStyle(
                                        fontWeight: e == 2
                                            ? FontWeight.w700
                                            : FontWeight.w400),
                                  ),
                                ),
                                Text(
                                  "₹ 199",
                                  style: TextStyle(
                                      fontWeight: e == 2
                                          ? FontWeight.w700
                                          : FontWeight.w400),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Variation 1",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Select up to 1 option",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...[1, 2, 3, 4].map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Fresh Pan(Per)",
                                    style: TextStyle(
                                        fontWeight: e == 2
                                            ? FontWeight.w700
                                            : FontWeight.w400),
                                  ),
                                ),
                                Text(
                                  "₹ 199",
                                  style: TextStyle(
                                      fontWeight: e == 2
                                          ? FontWeight.w700
                                          : FontWeight.w400),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
