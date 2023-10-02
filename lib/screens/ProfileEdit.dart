import 'package:flutter/material.dart';
import 'package:good_will/widget/pageBackground.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileEdit extends StatefulWidget {
  ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController _nameController = TextEditingController();

  String? name = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = "Amjad Ali";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          pageBackground(
              fistBoxColor: Colors.teal[200]!,
              secondBoxColor: Colors.grey[200]!),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Card(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              const BorderSide(width: 0.5, color: Colors.teal)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.teal,
                            child: Text(
                              name.isNotEmptyAndNotNull
                                  ? name!.substring(0, 1).toUpperCase()
                                  : "A",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 63,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            name ?? "Anonymous",
                            style: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            "amjad@gmail.com",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          const Text(
                            "[ UID: 2548426 ]",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 0.5)),
                            labelText: "Name",
                            hintText: "Enter your name",
                            labelStyle: TextStyle(color: Colors.teal),
                          ),
                          onChanged: (value) {
                            // _nameController.text=value;
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal),
                        onPressed: () {
                          name = _nameController.text;
                          setState(() {
                            _nameController.clear();
                          });
                        },
                        child: const Text("Update"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Note: ",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold)),
                            const Expanded(
                                child: Text(
                              "We never colllect your personal data for other use or third party use, its just colleted so that we can identify you later on.",
                              style: TextStyle(color: Colors.teal, fontSize: 8),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
