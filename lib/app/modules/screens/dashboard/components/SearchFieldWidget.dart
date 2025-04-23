import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/app/cores/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearch;

  const SearchFieldWidget({
    Key? key,
    this.controller,
    this.onChanged,
    this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(
          color: isDarkMode ? Colors.white70 : Colors.black54,
        ),
        fillColor: isDarkMode
            ? secondaryColorDark
            : Colors.white54, // Updated fillColor
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkMode
                ? Colors.white54
                : Colors.black54, // Border color based on theme
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkMode
                ? Colors.white
                : primaryColorDark, // Focused border color based on theme
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: InkWell(
          onTap: onSearch,
          child: Container(
            padding: EdgeInsets.all(Responsive.isMobile(context) ? 12 : 12),
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.blueGrey : primaryColorLight,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: isDarkMode
                      ? Colors.black.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ], // Added shadow here
            ),
            child: SvgPicture.asset(
              "assets/icons/Search.svg",
            ),
          ),
        ),
      ),
    );
  }
}
