import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ordering/modules/restaurant/widgets/appbar_content_widget.dart';
import 'package:ordering/modules/restaurant/widgets/menu_tile.dart';

class RestaurantDashboardView extends HookWidget {
  const RestaurantDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    const collapsedBarHeight = 60.0;
    const expandedBarHeight = 340.0;

    final scrollController = useScrollController();
    final isCollapsed = useState(false);
    final currentHeight = useState(0.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          isCollapsed.value = scrollController.hasClients &&
              scrollController.offset >
                  (expandedBarHeight - collapsedBarHeight);
          if (scrollController.hasClients) {
            currentHeight.value = scrollController.offset;
          }
          return false;
        },
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              width: double.maxFinite,
              child: Image.network(
                "https://b.zmtcdn.com/data/pictures/chains/1/18624001/a26ce254d26a3c73d83fa91f01d8f29c.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    currentHeight.value >
                            (expandedBarHeight - collapsedBarHeight)
                        ? Colors.white
                        : Colors.white.withOpacity(currentHeight.value /
                            (expandedBarHeight - collapsedBarHeight)),
                    Colors.black.withOpacity(0.5),
                    Colors.black,
                  ],
                ),
              ),
              height: 400,
              width: double.maxFinite,
            ),
            CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: expandedBarHeight,
                  collapsedHeight: collapsedBarHeight,
                  centerTitle: false,
                  pinned: true,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isCollapsed.value ? 1 : 0,
                    child: const CollapsedAppBarContent(),
                  ),
                  elevation: 0,
                  backgroundColor:
                      isCollapsed.value ? Colors.white : Colors.transparent,
                  flexibleSpace: const FlexibleSpaceBar(
                    background: ExpandedAppBarContent(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          15,
                        ),
                        topRight: Radius.circular(
                          15,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 40,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: const Color(0xffdddddd),
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 12),
                                ...[
                                  "Filters",
                                  "Veg",
                                  "Non-veg",
                                  "Bestseller",
                                  "Spicy"
                                ].map(
                                  (e) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              blurRadius: 1)
                                        ],
                                        border: Border.all(
                                            color: const Color(0xffdddddd)),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Column(
                            children: [
                              ...[1, 2, 3].map((e) {
                                return const MenuTile();
                              }),
                              const SizedBox(height: 30),
                            ],
                          ),
                          const SizedBox(height: 56),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 1),
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        border: Border.all(
                          color: Color(0xffDDDDDD),
                        ),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: TextFormField(
                        cursorHeight: 20,
                        cursorColor: const Color(0xffbbbbbb),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff444444),
                        ),
                        enabled: false,
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: "Search in Castle's Barbeque",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xffbbbbbb),
                          ),
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color(0xffdd2f6e),
                        Color(0xffed3f7e),
                      ], begin: Alignment.topLeft, end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      "Menu",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
