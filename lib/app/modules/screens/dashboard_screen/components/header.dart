import 'package:admin_dashboard/app/modules/screens/dashboard_screen/components/ProfileCardWidget.dart';
import 'package:admin_dashboard/app/modules/screens/dashboard_screen/components/SearchFieldWidget.dart';
import 'package:flutter/material.dart';
import '../../../../../responsive.dart';

class Header extends StatefulWidget {
  final String? title;
  final Widget? titleWidget;
  final bool showProfile;
  final bool showCalendar;
  final ValueChanged<String>? onSearch;
  final String? hintext;
  final TextStyle? hintStyle;
  final ValueChanged<DateTime>? onDateSelected;

  const Header({
    Key? key,
    this.title,
    this.titleWidget,
    this.showProfile = true,
    this.onSearch,
    this.hintext,
    this.hintStyle,
    this.showCalendar = true,
    this.onDateSelected,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final formattedDate =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";

      setState(() {
        _searchController.text = formattedDate;
      });

      widget.onSearch?.call(formattedDate);
      widget.onDateSelected?.call(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget displayTitle = widget.titleWidget ??
        Text(
          widget.title ?? "",
          style: Theme.of(context).textTheme.titleLarge,
        );

    return Row(
      children: [
        if (!Responsive.isMobile(context)) displayTitle,
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
          child: SearchFieldWidget(
            controller: _searchController,
            onChanged: widget.onSearch,
            hintext: widget.hintext ?? 'Search',
            hintStyle: widget.hintStyle,
          ),
        ),
        if (widget.showProfile)
          const ProfileCardWidget(
            profileImageUrl:
                "https://avatars.githubusercontent.com/u/110383694?v=4",
            userName: "KakElay",
          ),
        if (widget.showCalendar)
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () => _selectDate(context),
          ),
      ],
    );
  }
}
