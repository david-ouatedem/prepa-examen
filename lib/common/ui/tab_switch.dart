import 'package:flutter/material.dart';

class TabSwitch  extends StatelessWidget {
  const TabSwitch({
    super.key,
    required this.tabs,
    this.onChanged,
    required this.selectedTabIndex
  });

  final List tabs;
  final ValueChanged<int>? onChanged;
  final int selectedTabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       color: Theme.of(context).colorScheme.secondary,
       borderRadius: BorderRadius.circular(32),
     ),
      padding: const EdgeInsets.all(4),
        child: Row(
         children: List.generate(tabs.length, (index){
           final bool isSelected = selectedTabIndex == index;
           return Expanded(
               child: GestureDetector(
                 onTap: () => onChanged?.call(index),
                   child: AnimatedContainer(
                     duration: const Duration(milliseconds: 250),
                     curve: Curves.easeInOut,
                     padding: const EdgeInsets.symmetric(vertical: 12),
                     decoration: BoxDecoration(
                       color: isSelected
                           ? Theme.of(context).colorScheme.onPrimary
                           : Colors.transparent,
                       borderRadius: BorderRadius.circular(32),
                     ),
                     child: Center(
                       child: Text(
                         tabs[index],
                         style: TextStyle(
                           color: isSelected
                               ? Colors.white
                               : Theme.of(context).colorScheme.onSecondary,
                           fontWeight:
                           isSelected ? FontWeight.w600 : FontWeight.w400,
                         ),
                       ),
                     ),
                   ),
               )
           );
         }),
        )
    );
  }
}