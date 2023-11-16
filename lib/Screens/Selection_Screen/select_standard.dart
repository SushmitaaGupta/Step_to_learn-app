import 'package:educational_app/Screens/Home/HomePage/home_page.dart';
import 'package:educational_app/theme/constants.dart';
import 'package:flutter/material.dart';

class SelectStandard extends StatefulWidget {
  const SelectStandard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectStandardState createState() => _SelectStandardState();
}

class _SelectStandardState extends State<SelectStandard> {
  // ignore: non_constant_identifier_names
  List<String> Standard = ["First", "Second", "Third", "Fourth"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor, title: const Text("Select Standard")),
      body: ListView.builder(
        itemCount: Standard.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(Standard[index]),
            tileColor: selectedIndex == index ? kPrimaryLightColor : null,
            onTap: () {
              setState(() {
                // selectedIndex = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      standard: Standard[index],
                    ),
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}
