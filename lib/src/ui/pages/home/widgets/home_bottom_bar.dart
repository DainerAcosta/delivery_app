import 'package:delivery_app/src/ui/pages/home/home_controller.dart';
import 'package:delivery_app/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeBottomBar extends StatelessWidget {
  HomeBottomBar({Key? key}) : super(key: key);

  final List<BottomBarItem> _items = [
    BottomBarItem(
      icon: 'assets/pages/home/home.svg',
      label: 'Home',
    ),
    BottomBarItem(
      icon: 'assets/pages/home/favorite.svg',
      label: 'Favorites',
    ),
    BottomBarItem(
      icon: 'assets/pages/home/bell.svg',
      label: 'Notification',
    ),
    BottomBarItem(
      icon: 'assets/pages/home/avatar.svg',
      label: 'More',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context, listen: false);
    final int currentPage =
        context.select<HomeController, int>((_) => _.currentPage);
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          return BottomBarItemButton(
            item: item,
            isActive: currentPage == index,
            onPressed: () => controller.setPage(index),
          );
        }),
      ),
    );
  }
}

class BottomBarItemButton extends StatelessWidget {
  const BottomBarItemButton({
    Key? key,
    required this.item,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  final BottomBarItem item;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Color color = isActive ? primaryColor : Colors.black;
    return Expanded(
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 10),
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              item.icon,
              width: 32,
              color: color,
            ),
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarItem {
  final String icon, label;

  BottomBarItem({
    required this.icon,
    required this.label,
  });
}
