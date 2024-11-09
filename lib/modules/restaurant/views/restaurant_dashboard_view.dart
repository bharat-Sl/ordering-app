import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ordering/core/utils/assets.dart';

class RestaurantDashboardView extends HookWidget {
  const RestaurantDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    const collapsedBarHeight = 60.0;
    const expandedBarHeight = 400.0;

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
                      minHeight: MediaQuery.of(context).size.height,
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Material(
                    elevation: 0,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        15,
                      ),
                      topRight: Radius.circular(
                        15,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          15,
                        ),
                        topRight: Radius.circular(
                          15,
                        ),
                      ),
                      child: Scaffold(),
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
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Castle's Barbeque",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "3rd Floor, Mall Fifty One, Sector 51, Gurgaon",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.watch_later,
                    color: Colors.pink[200],
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
            ],
          ),
          SizedBox(width: 12),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.yellow,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text("4.2", style: TextStyle(color: Colors.white)),
                Text(
                  "(189)",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
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
