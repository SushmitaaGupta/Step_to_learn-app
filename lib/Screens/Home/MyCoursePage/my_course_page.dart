// import 'package:educational_app/datas/category_list_json.dart';
import 'package:educational_app/datas/courses_json.dart';
import 'package:educational_app/theme/constants.dart';
import 'package:educational_app/theme/padding.dart';
import 'package:educational_app/widgets/custom_heading.dart';
import 'package:educational_app/widgets/custom_my_courses_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyCoursesPageState createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    // var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        children: [
          const SizedBox(height: spacer - 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomHeading(
                title: 'My Courses',
                subTitle: 'Let\'s continue, shall we?',
                color: secondary,
              ),
              Text(
                '${MyCoursesJson.length} Courses',
                style: const TextStyle(color: secondary, fontSize: 15.0),
              ),
            ],
          ),
          const SizedBox(height: spacer),
          Column(
            children: List.generate(MyCoursesJson.length, (index) {
              var data = MyCoursesJson[index];
              // List lecturer = Code['popular_lecturer'] as List;
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                  onTap: () {
                 
                  },
                  child: CustomMyCoursesCard(
                    image: data['image'],
                    title: data['title'],
                    instructor: data['user_name'],
                    videoAmount: data['video'],
                    percentage: data['percentage'],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}