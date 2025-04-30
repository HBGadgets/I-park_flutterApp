import 'package:flutter/material.dart';

class ValleyBoyScreen extends StatefulWidget {
  const ValleyBoyScreen({super.key});

  @override
  ValleyBoyScreenState createState() => ValleyBoyScreenState();
}

class ValleyBoyScreenState extends State<ValleyBoyScreen> {

  final List<Map<String, String>> valleyBoys = [
    {
      "name": "Shankar Singh",
      "supervisor": "Supervisor 1",
      "mobile": "9823042181",
      "parking": "5 Parking",
      "shift": "A",
      "address": "Address 1, City 1",
      "image": "assets/shankar.png",
    },
    {
      "name": "Mankar Singh",
      "supervisor": "Supervisor 2",
      "mobile": "9823042182",
      "parking": "8 Parking",
      "shift": "B",
      "address": "Address 2, City 2",
      "image": "assets/mankar.png",
    },
    {
      "name": "Tankar Singh",
      "supervisor": "Supervisor 3",
      "mobile": "9823042183",
      "parking": "3 Parking",
      "shift": "C",
      "address": "Address 3, City 3",
      "image": "assets/tankar.png",
    },
    {
      "name": "Lankar Singh",
      "supervisor": "Supervisor 4",
      "mobile": "9823042184",
      "parking": "2 Parking",
      "shift": "D",
      "address": "Address 4, City 4",
      "image": "assets/lankar.png",
    },
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            " +   Add Valley Boy",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  ...List.generate(valleyBoys.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.black,
                              ),
                              Text(
                                valleyBoys[index]["name"]!,
                                style: TextStyle(fontSize: 15),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
        Card(
          color: Colors.white,
          elevation: 4,
          margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Adjust padding as needed
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.black,
                ),
                SizedBox(height: 5),
                Text(valleyBoys[selectedIndex]["name"]!, style: TextStyle(fontSize: 18)),
                Text("001", style: TextStyle(fontSize: 15)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Supervisor", style: TextStyle(fontSize: 18)),
                          Text("Mobile Number", style: TextStyle(fontSize: 18)),
                          Text("Parking Details", style: TextStyle(fontSize: 18)),
                          Text("Shift", style: TextStyle(fontSize: 18)),
                          Text("Address", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                // Add spacing between columns
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(":", style: TextStyle(fontSize: 18)),
                          Text(":", style: TextStyle(fontSize: 18)),
                          Text(":", style: TextStyle(fontSize: 18)),
                          Text(":", style: TextStyle(fontSize: 18)),
                          Text(":", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                    SizedBox(width: 10), // Add spacing between columns
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(valleyBoys[selectedIndex]["supervisor"]!, style: TextStyle(fontSize: 18)),
                          Text(valleyBoys[selectedIndex]["mobile"]!, style: TextStyle(fontSize: 18)),
                          Text(valleyBoys[selectedIndex]["parking"]!, style: TextStyle(fontSize: 18)),
                          Text(valleyBoys[selectedIndex]["shift"]!, style: TextStyle(fontSize: 18)),
                          Container(
                            width: 200,
                            child: Text(
                              valleyBoys[selectedIndex]["address"]!,
                              maxLines: 2, // Limit to 2 lines
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),]
        ),
      ),
    );
  }
}