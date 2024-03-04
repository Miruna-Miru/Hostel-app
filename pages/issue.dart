import 'package:flutter/material.dart';

class Issues extends StatefulWidget {
  const Issues({super.key});

  @override
  State<Issues> createState() => _IssuesState();
}

class _IssuesState extends State<Issues> {
  TextEditingController name = TextEditingController();
  TextEditingController issue = TextEditingController();
  TextEditingController roomNo = TextEditingController();

  var hostelTypes = ["Select hostel type", "Boys Hostel", "Girls Hostel"];
  String selectedHostelType = "Select hostel type";

  var boysHostels = ["Block", "H1", "H2", "H3", "H4"];
  var girlsHostels = ["Block", "Main Hostel", "New Hostel"];
  String selectedHostel = "Block";

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.purple),
                  ),
                  Text(
                    "Raise an issue!!",
                    style: TextStyle(color: Colors.purple, fontSize: 36),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person, color: Colors.purple),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                  controller: name,
                  validator: (nm) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Room No",
                      prefixIcon: Icon(Icons.home_filled, color: Colors.purple),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: "Room no",
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                  controller: roomNo,
                  validator: (rn) {},
                ),
              ),
              SizedBox(height: 20,),
              // Dropdown for selecting hostel type
             /* Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  DropdownButton(
                    value: selectedHostelType,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedHostelType = newValue!;
                        selectedHostel = "Block";
                      });
                    },
                    items: hostelTypes.map((String hostelType) {
                      return DropdownMenuItem(
                        value: hostelType,
                        child: Text(hostelType),
                      );
                    }).toList(),
                  ),
                ],
              ),


              */
              Container(
                width: 330,
                height: 70,
                decoration:BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.house_siding_outlined,
                          color: Colors.purple,
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                borderRadius: BorderRadius.circular(20),
                                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.purple),
                                value: selectedHostelType,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedHostelType = newValue!;
                                    selectedHostel = "Block";
                                  });
                                },
                                items: hostelTypes.map((String hostelType) {
                                  return DropdownMenuItem(
                                    value: hostelType,
                                    child: Text(hostelType,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),

                            )
                        )
                      ],
                    ),
                  ),
              ),
              SizedBox(height: 20,),
              // Dropdown for selecting hostel
              Container(
                width: 330,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.holiday_village,
                        color: Colors.purple,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: IgnorePointer(
                          ignoring: selectedHostelType == "Select hostel type",
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(20),
                              value: selectedHostel,
                              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.purple),
                              items: (selectedHostelType == "Boys Hostel")
                                  ? boysHostels.map((String hostel) {
                                return DropdownMenuItem(
                                  value: hostel,
                                  child: Text(
                                    hostel,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                );
                              }).toList()
                                  : girlsHostels.map((String hostel) {
                                return DropdownMenuItem(
                                  value: hostel,
                                  child: Text(
                                    hostel,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedHostel = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Text(
                      "Drop your issues here!!",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  minLines: 3,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  controller: issue,
                  validator: (isu) {},
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    issue.notifyListeners();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => sub_iss()), // REMOVE IT I HAVE JUST ADDED TO CHECK IF NAVIGATION IS GOOD!!
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  child: Text("Submit",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//THIS IS A SAMPLE CLASS TO CHECK IF THE NAVIGATION WORKS PROPERLY!!!! ---- DON'T INCLUDE  THIS 

class sub_iss extends StatelessWidget {
  const sub_iss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Center(
                      child: Text("Take a chill !!",)
                  )
                ],
              ),
            ),
    );
  }
}
