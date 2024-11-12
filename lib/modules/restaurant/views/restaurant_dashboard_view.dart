import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ordering/core/utils/assets.dart';
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

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        isCollapsed.value = scrollController.hasClients &&
            scrollController.offset > (expandedBarHeight - collapsedBarHeight);
        if (scrollController.hasClients) {
          currentHeight.value = scrollController.offset;
        }
        return false;
      },
      child: Stack(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height / 1.5),
            child: Image.network(
              "https://img.freepik.com/premium-photo/friends-celebrating-new-years-eve_53876-150291.jpg?w=740",
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
                  currentHeight.value > (expandedBarHeight - collapsedBarHeight)
                      ? Colors.white
                      : Colors.white.withOpacity(currentHeight.value /
                          (expandedBarHeight - collapsedBarHeight)),
                  Colors.black.withOpacity(0.5),
                  Colors.black,
                ],
              ),
            ),
            height: MediaQuery.of(context).size.height / 1.5,
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
                  child: CollapsedAppBarContent(),
                ),
                elevation: 0,
                backgroundColor:
                    isCollapsed.value ? Colors.white : Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: ExpandedAppBarContent(),
                ),
              ),
              SliverToBoxAdapter(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 70,
                      maxHeight: MediaQuery.of(context).size.height - 70),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        15,
                      ),
                      topRight: Radius.circular(
                        15,
                      ),
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      body: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 40,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: Color(0xffdddddd),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                            SizedBox(height: 24),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 12),
                                  ...[
                                    "Filters",
                                    "Veg",
                                    "Non-veg",
                                    "Bestseller",
                                    "Spicy"
                                  ].map(
                                    (e) => Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                blurRadius: 1)
                                          ],
                                          border: Border.all(
                                              color: Color(0xffdddddd)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 24),
                            MenuTile(),
                            MenuTile(),
                            MenuTile(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ExpandedAppBarContent extends StatelessWidget {
  const ExpandedAppBarContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        children: [
          Expanded(child: SizedBox()),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Castle's Barbeque",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "3rd Floor, Mall Fifty One, Sector 51, Gurgaon",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 12),
                    Wrap(
                      runSpacing: 2,
                      children: [
                        Text(
                          "₹1700 for two • ",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ...["Chinese", "North Indian", "South Indian"]
                            .asMap()
                            .map<int, Widget>(
                              (k, e) {
                                return MapEntry<int, Widget>(
                                  k,
                                  Text(
                                    "${e}${k < 2 ? " • " : ""}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white.withOpacity(0.8),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              },
                            )
                            .values
                            .toList(),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.watch_later,
                            color: Colors.amber,
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Opens in 15 mins",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 6),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xffdd2f6e),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 2),
                              Text("9.4",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(width: 2),
                              Icon(
                                Icons.star_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "182\nReviews",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.8)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CollapsedAppBarContent extends StatelessWidget {
  const CollapsedAppBarContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: Image.asset(
            Assets.logoBG,
            fit: BoxFit.cover,
            color: Color(0xffdd2f6e),
          ),
        ),
        SizedBox(width: 8),
        Text(
          "Castle's Barbeque",
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
