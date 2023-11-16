import 'package:educational_app/datas/account_menu_json.dart';
import 'package:educational_app/datas/user_profile.dart';
import 'package:educational_app/theme/constants.dart';
import 'package:educational_app/theme/padding.dart';
import 'package:educational_app/widgets/custom_button_box.dart';
import 'package:educational_app/widgets/custom_heading.dart';
import 'package:educational_app/widgets/custom_place_holder.dart';
import 'package:educational_app/widgets/custom_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  

  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body:getBody(),
    );
  }

  Widget getSignIn() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        children: [
          const SizedBox(height: spacer - 1.0),

          //header
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomHeading(
                title: 'Account',
                subTitle: 'Student',
                color: secondary,
              ),
            ],
          ),
          const SizedBox(height: spacer),

          Column(
            children: List.generate(1, (index) {
              List data = AccountMenuJson[2]['categories'];
              return Padding(
                padding: const EdgeInsets.only(bottom: spacer),
                child: Column(
                  children: [
                    CustomTitle(
                      title: AccountMenuJson[2]['title'],
                      extend: false,
                    ),
                    const SizedBox(height: smallSpacer),
                    Column(
                      children: List.generate(data.length, (j) {
                        return CunstomPlaceHolder(
                          title: data[j]['title'],
                          isSwitch: data[j]['isSwitch'],
                        );
                      }),
                    )
                  ],
                ),
              );
            }),
          ),
          GestureDetector(
            onTap: () async {
           
            },
            child: const CustomButtonBox(title: 'Sign In'),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        children: [
          const SizedBox(height: spacer - 1.0),

          //header
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomHeading(
                title: 'Account',
                subTitle: 'Student',
                color: secondary,
              ),
              Text(
                'Become an Instructor?',
                style: TextStyle(color: primary, fontSize: 15.0),
              ),
            ],
          ),
          const SizedBox(height: spacer),

          //profile
          SizedBox(
            height: size.width * .3,
            width: size.width * .3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                UserProfile['image'].toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: smallSpacer),
          Text(
            UserProfile['full_name'].toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: secondary,
            ),
          ),
          const SizedBox(height: miniSpacer),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 15,
                color: primary,
              ),
            ),
          ),
          const SizedBox(height: spacer),

          Column(
            children: List.generate(
              AccountMenuJson.length,
              (index) {
                List data = AccountMenuJson[index]['categories'];
                return Padding(
                  padding: const EdgeInsets.only(bottom: spacer),
                  child: Column(
                    children: [
                      CustomTitle(
                        title: AccountMenuJson[index]['title'],
                        extend: false,
                      ),
                      const SizedBox(height: smallSpacer),
                      Column(
                        children: List.generate(
                          data.length,
                          (j) {
                            return CunstomPlaceHolder(
                              title: data[j]['title'],
                              isSwitch: data[j]['isSwitch'],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                  context: context, builder: (context) => getPopup());
            },
            child: const CustomButtonBox(title: 'Sign Out'),
          ),
          const SizedBox(height: smallSpacer),
          Container(
            alignment: Alignment.center,
            child: Text(
              'V1.0.1',
              style:
                  TextStyle(fontSize: 12.0, color: secondary.withOpacity(.5)),
            ),
          ),
          const SizedBox(height: spacer),
        ],
      ),
    );
  }

  Widget getPopup() {
    return CupertinoActionSheet(
      title: const Text('Are you sure you want to sign out?'),
      cancelButton: CupertinoActionSheetAction(
        child: const Text(
          'Cancel',
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          onPressed: () {
          
          },
          child: const Text(
            'Sign Out',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}