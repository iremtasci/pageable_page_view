library pageable_page_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageablePageView<T> extends StatefulWidget {
  final List<T> list;
  final int itemPerPage;
  //final Function? onPageChanged;
  final int initialPage;
  final Widget? child;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final ScrollPhysics physics;
  final String Function(dynamic) titleDisplay;
  final String Function(dynamic) subTitleDisplay;
  final String Function(dynamic) itemDisplay;
  final String extraAlan;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? listTileOnTap;

  PageablePageView(
      {Key? key,
      required this.list,
      required this.itemPerPage,
      //this.onPageChanged,
      this.initialPage = 0,
      this.child,
      this.shrinkWrap = true,
      this.scrollDirection = Axis.vertical,
      this.physics = const AlwaysScrollableScrollPhysics(),
      required this.itemDisplay,
      required this.titleDisplay,
      required this.subTitleDisplay,
      this.extraAlan = "",
      this.prefixIcon,
      this.suffixIcon,
      this.listTileOnTap})
      : super(key: key);

  @override
  State<PageablePageView> createState() => _PageablePageViewState();
}

class _PageablePageViewState<T> extends State<PageablePageView<T>> {
  int lastIndex = 0;
  List<T> showingList = [];
  PageController pageController = PageController();
  int prePage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.initialPage);
    showingList
        .addAll(widget.list.skip(lastIndex).take(widget.itemPerPage).toList());
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: (currentPage) async {
        if (prePage < currentPage) {
          getNextPage();
          prePage = currentPage;
        }
        if (prePage > currentPage) {
          getPreviousPage();
          prePage = currentPage;
        }
        setState(() {});
      },
      children: [
        for (var i = 0;
            i < (widget.list.length / widget.itemPerPage).ceil();
            i++)
          ListView.builder(
            shrinkWrap: widget.shrinkWrap,
            scrollDirection: widget.scrollDirection,
            physics: widget.physics,
            itemCount: showingList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: widget.prefixIcon,
                  title:
                      Text(widget.titleDisplay(showingList[index]).toString()),
                  subtitle: Text(
                      widget.subTitleDisplay(showingList[index]).toString()),
                  trailing: widget.suffixIcon,
                  onTap: widget.listTileOnTap,
                ),
              );
            },
          )
      ],
    );
  }

  List<dynamic> getNextPage() {
    if (lastIndex + widget.itemPerPage < widget.list.length) {
      showingList.clear();
      lastIndex += widget.itemPerPage;
      showingList
          .addAll(widget.list.skip(lastIndex).take(widget.itemPerPage).toList());
      if (lastIndex > widget.list.length) {
        lastIndex = 0;
      }
    }
    return showingList;
  }

  List<dynamic> getPreviousPage() {
    if (lastIndex - widget.itemPerPage >= 0) {
      showingList.clear();
      lastIndex -= widget.itemPerPage;
      showingList
          .addAll(widget.list.skip(lastIndex).take(widget.itemPerPage).toList());
    }
    return showingList;
  }
}
