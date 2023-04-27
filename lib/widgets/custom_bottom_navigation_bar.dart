import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {Key? key, required this.selectedPageIndex, required this.onIconTap})
      : super(key: key);
  final int selectedPageIndex;
  final Function onIconTap;

  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.06;

    return BottomAppBar(
      child: Container(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomBarNavItem(1, 'Home', TextStyle(), 'home'),
            _bottomBarNavItem(2, 'Discover', TextStyle(), 'search'),
            _bottomBarNavItem(3, 'Inbox', TextStyle(), 'message'),
            _bottomBarNavItem(4, 'Profile', TextStyle(), 'account'),
          ],
        ),
      ),
    );
  }

  _bottomBarNavItem(
      int index, String label, TextStyle textStyle, String iconName) {
    bool isSelected = selectedPageIndex == index;
    Color iconAndTextColor = isSelected ? Colors.black : Colors.grey;

    if (isSelected && selectedPageIndex == 0) {
      iconAndTextColor = Colors.white;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
            'assets/${isSelected ? iconName + '_filled' : iconName}.svg',
            color: iconAndTextColor,
        ),
            
        SizedBox(
          height: 3,
        ),
        Text(label, style: textStyle.copyWith(color: iconAndTextColor),)
      ],
    );
  }
}
