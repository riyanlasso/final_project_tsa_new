import 'package:final_project_tsa_new/cleanhomeCustomer.dart';

import 'package:flutter/material.dart';

class profileART extends StatefulWidget {
  const profileART({Key? key}) : super(key: key);

  // final String title;

  @override
  _profileART createState() => _profileART();
}

class _profileART extends State<profileART> {
  Container buildPost() {
    //comment
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Card(
        margin: EdgeInsets.all(0.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              // color: Color.fromARGB(255, 0, 0, 0),
                              border: Border.all(
                                  color: Color.fromARGB(255, 184, 157, 157),
                                  width: 2),
                              shape: BoxShape.circle),
                          child: Image.asset('profileART.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text("gfihfigia"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          value: "delete",
                          child: Text("Delete Post"),
                        ),
                        PopupMenuItem(
                          value: "save",
                          child: Text("Save Post"),
                        ),
                      ];
                    },
                    child: Icon(Icons.arrow_drop_down),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    "HELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLOHELLO",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 275,
                  color: Colors.transparent,
                  padding: EdgeInsets.only(bottom: 0),
                  child: Container(
                    width: size.width,
                    height: 650,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(10, 10),
                        bottomRight: Radius.elliptical(10, 10),
                      ),
                      image: DecorationImage(
                        image: AssetImage('banner.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),

                // * 1 backbutton (Row widget)
                Row(
                  children: [
                    IconButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => cleanhomecustomer()));
                      },
                      icon: Icon(Icons.arrow_back),
                    )
                  ],
                ),

                // * user profile image
                Positioned(
                  top: 40,
                  left: size.width / 3.6,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 3),
                        shape: BoxShape.circle),
                    child: Image.asset('profileART.png'),
                  ),
                ),
              ],
            ),
            Container(
              child: ListTile(
                title: Row(
                  children: const [
                    Text(
                      "Thomas Shelby",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                subtitle: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.grey.shade400,
                          ),
                          Text(
                            "Malang,Jawa Timur",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.grey.shade400,
                          ),
                          const Text(
                            "Laki - Laki",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.grey.shade400,
                          ),
                          const Text(
                            "Student",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 99, 231, 104),
                    borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => cleanhomecustomer()),
                    );
                  },
                  child: const Text(
                    'HIRE',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                buildPost(),
                buildPost(),
                buildPost(),
                buildPost()
              ],
            ),
          ],
        ),
      )),
    );
  }
}
