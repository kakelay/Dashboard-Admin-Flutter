import 'package:admin_dashboard/app/cores/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../data/models/MyFiles.dart';
import '../../../../../responsive.dart';
import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            PopupMenuButton<String>(
              color: secondaryColorDark,
              onSelected: (value) {
                print("$value clicked");
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: "Add Image",
                  child: ListTile(
                    leading: Icon(Icons.image),
                    title: Text("Add Image"),
                  ),
                ),
                const PopupMenuItem(
                  value: "Add Video",
                  child: ListTile(
                    leading: Icon(Icons.video_library),
                    title: Text("Add Video"),
                  ),
                ),
                const PopupMenuItem(
                  value: "Add Document",
                  child: ListTile(
                    leading: Icon(Icons.insert_drive_file),
                    title: Text("Add Document"),
                  ),
                ),
                const PopupMenuItem(
                  value: "Close Menu",
                  child: ListTile(
                    leading: Icon(Icons.close),
                    title: Text("Close"),
                  ),
                ),
              ],
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.blue,
                  disabledBackgroundColor:
                      isDarkMode ? Colors.blueGrey : primaryColorDark,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: null, // Disabled to use PopupMenuButton's tap
                icon: const Icon(Icons.add, color: Colors.white),
                label: Text(
                  "Add New Files",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: const FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
