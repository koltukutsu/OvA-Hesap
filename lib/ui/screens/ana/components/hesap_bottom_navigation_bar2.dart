// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/navigation/constants/nav_bar_items.dart';
import 'package:hesap/cubit/navigation/navigation_cubit.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';

class HesapBottomNavigationBar extends StatefulWidget {
  const HesapBottomNavigationBar(
      {Key? key, required this.index, required this.onChangedTab})
      : super(key: key);
  final int index;
  final ValueChanged<int> onChangedTab;

  @override
  State<HesapBottomNavigationBar> createState() => _HesapBottomNavigationBar();
}

class _HesapBottomNavigationBar extends State<HesapBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    const placeHolder = Opacity(
      opacity: 0,
      child: IconButton(
        icon: Icon(Icons.no_cell),
        onPressed: null,
      ),
    );
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(index: 0, icon: const Icon(Icons.home)),
            placeHolder,
            buildTabItem(index: 1, icon: const Icon(Icons.fastfood)),
            // buildTabItem(index: 2, icon: const Icon(Icons.room_service)),
            // buildTabItem(index: 3, icon: const Icon(Icons.person)),
          ],
        ),
    );
  }

  Widget buildTabItem({required int index, required Icon icon}) {
    final isSelected = index == widget.index;
    return IconTheme(
      data: IconThemeData(
        color: isSelected ? AppColors.chosen : AppColors.gray,
      ),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return IconButton(
            icon: icon,
            // onPressed: () => widget.onChangedTab(index),
            onPressed: () {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context).getNavBarItem(NavbarItem.restaurantEkran);
              }
              if (index == 1) {
                BlocProvider.of<NavigationCubit>(context).getNavBarItem(NavbarItem.siparisEkran);
              }
            }
          );
        }
      ),
    );
  }
// void onChangedBottomNavigationBar(int value) {
//   setState(() {
//     index = value;
//   });
// }
}
