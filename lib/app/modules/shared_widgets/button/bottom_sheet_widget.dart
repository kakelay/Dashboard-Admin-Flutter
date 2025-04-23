import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../index.dart';

void buttonSheetWidget(BuildContext context) {
  showModalBottomSheet(
    context: context,
    scrollControlDisabledMaxHeightRatio: 50,
    builder: (BuildContext bc) {
      return Container(
        height: 650,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      height: 10,
                      width: 80,
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        TextWidget(
                          'Smart ',
                          fontSize: 20,
                          color: AppColors.appColor,
                          weight: FontWeight.w700,
                        ),
                        TextWidget(
                          'ល្អ! 1',
                          fontSize: 16,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    const Gap(20),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    'ទទួនបានអត្ថប្រយោជន៏',
                    fontSize: 20,
                    color: Colors.black,
                    weight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.language,
                        size: 30,
                        color: AppColors.appColor,
                      ),
                      const Gap(12),
                      TextWidget(
                        '5GB',
                        fontSize: 16,
                        color: Colors.black,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.phone_android_outlined,
                        size: 30,
                        color: AppColors.appColor,
                      ),
                      const Gap(12),
                      TextWidget(
                        '5GB',
                        fontSize: 16,
                        color: Colors.black,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.message,
                        size: 30,
                        color: AppColors.appColor,
                      ),
                      const Gap(12),
                      TextWidget(
                        '5GB',
                        fontSize: 16,
                        color: Colors.black,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    height: 120,
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'ចំណាំ : ',
                              style: TextStyle(
                                color: AppColors.appColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'រាល់ពេលដែលអ្នកភ្ជាប់គម្រោងម្តងទៀតមុនថ្ងៃកំណត់ រាល់ពេលដែលអ្នកភ្ជាប់គម្រោងម្តងទៀតមុនថ្ងៃកំណត់ រាល់ពេលដែលអ្នកភ្ជាប់គម្រោងម្តង ',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(20),
                  Divider(
                    height: 2,
                    color: Colors.grey.shade300,
                  ),
                  const Gap(20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ភ្ជាប់ចុងក្រោយនៅ:'),
                      Text('16.12.23'),
                    ],
                  ),
                  const Gap(10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ភ្ជាប់ម្តងទៀតនៅ:'),
                      Text('23.12.23'),
                    ],
                  ),
                  const Gap(10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('តម្លៃគម្រោង:'),
                      Text('1.00 ដុល្លារ'),
                    ],
                  ),
                  const Gap(10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'ប្រភេទនៃការភ្ជាប់គម្រោង:បន្តការភ្ជាប់ដោយស្វ័យប្រវត្តិជាប្រចាំសប្តាហ៏',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
