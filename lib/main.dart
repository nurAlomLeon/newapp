import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: CoursePage(),
        );
      },
    );
  }
}

class CoursePage extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {'title': 'JavaScript (MERN)', 'duration': '৬ ঘণ্টা বাকি', 'daysLeft': '৬ দিন বাকি', 'flag': '🇺🇸'},
    {'title': 'Python, Django & React', 'duration': '৮ ঘণ্টা বাকি', 'daysLeft': '৪০ দিন বাকি', 'flag': '🇬🇧'},
    {'title': 'Flutter', 'duration': '১৮ ঘণ্টা বাকি', 'daysLeft': '৪৪ দিন বাকি', 'flag': '🇧🇩'},
    {'title': 'PHP, Laravel & Vue.js', 'duration': '৮ ঘণ্টা বাকি', 'daysLeft': '৪০ দিন বাকি', 'flag': '🇮🇳'},
    {'title': 'ASP.NET Core', 'duration': '১২ ঘণ্টা বাকি', 'daysLeft': '৫০ দিন বাকি', 'flag': '🇨🇦'},
    {'title': 'SQA & Automated Testing', 'duration': '১০ ঘণ্টা বাকি', 'daysLeft': '৩০ দিন বাকি', 'flag': '🇩🇪'},
    {'title': 'DevOps', 'duration': '১৫ ঘণ্টা বাকি', 'daysLeft': '৩৫ দিন বাকি', 'flag': '🇫🇷'},
    {'title': 'Coding Interview Prep', 'duration': '৯ ঘণ্টা বাকি', 'daysLeft': '২০ দিন বাকি', 'flag': '🇯🇵'},
  ];

  int getCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1024) return 4; // Desktop
    if (screenWidth >= 600) return 3; // Tablet
    return 2; // Mobile
  }

  double getAspectRatio(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1024) return 0.75; // Desktop
    if (screenWidth >= 600) return 0.65; // Tablet
    return 0.6; // Mobile
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses', style: TextStyle(fontSize: 14.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossAxisCount(context),
            childAspectRatio: getAspectRatio(context),
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) => CourseCard(course: courses[index]),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Map<String, String> course;

  const CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  course['flag']!,
                  style: TextStyle(fontSize: 36.sp),
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoRow(Icons.people, course['duration']!),
                _buildInfoRow(Icons.calendar_today, course['daysLeft']!),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'Full Stack Web Development with ${course['title']!}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(), // Pushes the button to the bottom
            SizedBox(
              width: double.infinity,

              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'বিস্তারিত দেখুন',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.arrow_forward, size: 14.sp, color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12.sp),
        SizedBox(width: 3.w),
        Text(
          text,
          style: TextStyle(fontSize: 11.sp),
        ),
      ],
    );
  }
}
