import 'package:flutter/cupertino.dart';

Widget CustomRefreshIndicator({
  ScrollController? controller,
  required VoidCallback onRefresh,
  Widget? child,
  List<Widget> children = const [],
  double topSpacing = 0,
}) {
  return CustomScrollView(
    controller: controller,
    shrinkWrap: true,
    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    slivers: [
      CupertinoSliverRefreshControl(
        refreshIndicatorExtent: 100,
        onRefresh: () async {
          onRefresh();
        },
        builder: (
          context,
          refreshState,
          pulledExtent,
          refreshTriggerPullDistance,
          refreshIndicatorExtent,
        ) {
          return Padding(
            padding: EdgeInsets.only(top: topSpacing),
            child: CupertinoSliverRefreshControl.buildRefreshIndicator(
              context,
              refreshState,
              pulledExtent,
              refreshTriggerPullDistance + topSpacing,
              refreshIndicatorExtent,
            ),
          );
        },
      ),
      if (child != null)
        SliverFillRemaining(
          child: child,
        )
      else
        SliverList(
          delegate: SliverChildListDelegate.fixed(children),
        ),
    ],
  );
}
