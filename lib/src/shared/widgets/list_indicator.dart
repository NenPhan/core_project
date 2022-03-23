import 'package:flutter/material.dart';

class ListIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Function()? onLoadmore;
  final bool isLastPage;
  final bool isLoadingMore;
  final bool reversed;
  final double loadmoreOffset;
  final Color? color;
  final Widget child;
  final ScrollController? scrollController;
  const ListIndicator(
      {Key? key,
      required this.onRefresh,
      this.onLoadmore,
      this.loadmoreOffset = 200,
      this.isLastPage = false,
      this.isLoadingMore = false,
      this.reversed = false,
      this.scrollController,
      required this.child,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        if (reversed
            ? (scrollInfo.metrics.pixels <= loadmoreOffset)
            : (scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent - loadmoreOffset) &&
                !isLoadingMore) {
          if (scrollInfo is ScrollEndNotification) {
            loadmore();
          }
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: child,
        color: Colors.blue,
      ),
    );
  }

  loadmore() {
    if (!isLastPage && onLoadmore != null) {
      onLoadmore!.call();
    }
  }
}
