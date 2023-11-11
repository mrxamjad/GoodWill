import 'package:flutter/material.dart';
import 'package:good_will/Constants/FirebaseKey.dart';
import 'package:good_will/data/Data.dart';
import 'package:good_will/firebase/FirebaseService.dart';
import 'package:good_will/widget/pageBackground.dart';

class ProfileEdit extends StatefulWidget {
  ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final TextEditingController _nameController = TextEditingController();

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
                    child: FutureBuilder(
                        future: FirebaseService.userRef
                            .doc(DataClass.userKey)
                            .collection(FirebaseKey.profile)
                            .doc(FirebaseKey.profileId)
                            .get(),
                        builder: (context, snapchat) {
                          var data = snapchat.data;
                          if (snapchat.hasError) {
                            return const Center(
                              child: Text("Error in loading"),
                            );
                          } else if (snapchat.hasData) {
                            return Card(
                              color: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(
                                      width: 0.5, color: Colors.teal)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.teal,
                                    child: Text(
                                      data![FirebaseKey.name]
                                          .substring(0, 1)
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 63,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    data[FirebaseKey.name]
                                        .toString()
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    data[FirebaseKey.emailId],
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "[ ${data[FirebaseKey.phone]} ]",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const SizedBox(
                              height: 200,
                              width: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        }),
                  ),
                ),
                Column(
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
                          try {
                            FirebaseService.userRef
                                .doc(DataClass.userKey)
                                .collection(FirebaseKey.profile)
                                .doc(FirebaseKey.profileId)
                                .update(
                                    {FirebaseKey.name: _nameController.text});
                          } catch (e) {}

                          _nameController.clear();
                        });
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Note: ",
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold)),
                          Expanded(
                              child: Text(
                            "We never colllect your personal data for other use or third party use, its just colleted so that we can identify you later on.",
                            style: TextStyle(color: Colors.teal, fontSize: 8),
                          )),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
