import 'package:final_project_tsa_new/listART.dart';
import 'package:final_project_tsa_new/login.dart';
import 'package:final_project_tsa_new/profileART.dart';
import 'package:final_project_tsa_new/pilihMenuART.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class cleanhomeART extends StatelessWidget {
  const cleanhomeART({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              //search
              margin: const EdgeInsets.only(top: 35, left: 25, right: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 180, 179, 179),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              prefixIcon: Container(
                                padding: EdgeInsets.all(15),
                                child: Icon(
                                  Icons.youtube_searched_for,
                                  color: Colors.black,
                                ),
                                width: 18,
                              )),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.filter_list_outlined,
                            color: Colors.black,
                          ),
                          width: 25),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 27),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("HOME ART",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        children: [
                          Text("Asisten Rumah Tangga terbaik",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                    //column horizontal view
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => profileART(),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 27),
                              child: Container(
                                //box1
                                height: size.height * .15,
                                width: size.width * .5,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "profileART.png",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 10),
                                    child: Text(
                                      'THOMAS SHELBY',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                //box2
                                height: size.height * .15,
                                width: size.width * .5,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "profileART.png",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 10),
                                    child: Text(
                                      'THOMAS SHELBY',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              //box3
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                height: size.height * .15,
                                width: size.width * .5,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "profileART.png",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 10),
                                    child: Text(
                                      'THOMAS SHELBY',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 27),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        children: [
                          Text("Disekitar Anda",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                    //column horizontal view
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => profileART(),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 27),
                              child: Container(
                                //box1
                                height: size.height * .15,
                                width: size.width * .5,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "profileART.png",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 10),
                                    child: Text(
                                      'THOMAS SHELBY',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                //box2
                                height: size.height * .15,
                                width: size.width * .5,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "profileART.png",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 10),
                                    child: Text(
                                      'THOMAS SHELBY',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              //box3
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                height: size.height * .15,
                                width: size.width * .5,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        "profileART.png",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 10),
                                    child: Text(
                                      'THOMAS SHELBY',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //tambahwidget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15, top: 15),
                    child: Text(
                      "Menu",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // GestureDetector(
                      //   onTap: () => Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => listART(),
                      //       )),
                      //   child: CardField(
                      //     size,
                      //     Colors.blue,
                      //     Icon(
                      //       Icons.supervised_user_circle,
                      //       color: Colors.white,
                      //     ),
                      //     'Daftar ART',
                      //     '100 Terdaftar',
                      //   ),
                      // ),
                      CardField(
                          size,
                          Colors.amber,
                          Icon(Icons.lightbulb_outline, color: Colors.white),
                          'Bantuan',
                          'Help'),
                    ],
                  ),
                ],
              ),
            ),
            //test email and btn logout
            Padding(
              padding: EdgeInsets.only(left: 27, top: 10),
              child: Row(
                children: [
                  Text(user.email!),
                  ElevatedButton(
                      onPressed: () {
                        logout(context);
                        // FirebaseAuth.instance.signOut();
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => login(),
                        //   ),
                        // );
                      },
                      child: Text("SIGN OUT"))
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: IconTheme(
          data: const IconThemeData(color: Colors.white, size: 36),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cleanhomeART()));
                    },
                    icon: const Icon(Icons.home)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.location_on)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.payment)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pilihMenuART()));
                    },
                    icon: const Icon(Icons.supervisor_account_rounded)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CardField(
    Size size,
    Color color,
    Icon icon,
    String title,
    String subtitle,
  ) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
          child: SizedBox(
              height: size.height * .1,
              width: size.width * .39,
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: color,
                    child: icon,
                  ),
                  title: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  subtitle: Text(
                    subtitle,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
              ))),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => login(),
      ),
    );
  }
}
