import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchItems();
  }
  bool loading = true;


  fetchItems() async {
    genres.clear();
    selGenres.clear();
    var res = await http
        .get(Uri.parse("https://apimocha.com/flutterassignment/getGenres"));
    List temp = jsonDecode(res.body)['data']['genres'];
    temp.forEach((e) {
      genres.add(e['name']);
    });
    loading = false;
    setState(() {});
  }

  List genres = [];
  List selGenres = [];

  bool valueFirst = false;
  bool valueSecond = false;

  showTheBottom() async {
    await showModalBottomSheet(
        backgroundColor: Colors.black54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (cont, setS) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: const BoxDecoration(color: Colors.black54),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Genres",
                      style: TextStyle(color: Colors.orange),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Wrap(
                          spacing: 12,
                          alignment: WrapAlignment.start,
                          children: List.generate(genres.length, (index) {
                            bool sel = selGenres.contains(genres[index]);
                            return GestureDetector(
                              onTap: () {
                                if (sel) {
                                  selGenres.remove(genres[index]);
                                } else {
                                  selGenres.add(genres[index]);
                                }
                                setS(() {});
                              },
                              child: Chip(
                                  backgroundColor:
                                  sel ? Colors.orange : Colors.white,
                                  label: Text(genres[index])),
                            );
                          }),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.orange),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "OK",
                                style: TextStyle(color: Colors.orange),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: loading
          ? const Center(
        child: Text(
          "Loading..",
          style: TextStyle(color: Colors.white),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sign Up',
                      style: TextStyle(color: Colors.white)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cancel_rounded,
                        color: Colors.white,
                        size: 35.0,
                      ))
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Let's create your  ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'First Name*',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Last Name*',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Mobile No*',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  //prefixText: '+91',
                    prefix: Text(
                      '+91',
                      style: TextStyle(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Email*',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Genres',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              selGenres.isNotEmpty
                  ? Container(
                child: Wrap(
                    spacing: 12,
                    alignment: WrapAlignment.start,
                    children: List.generate(selGenres.length + 1,
                            (index) {
                          if (index == selGenres.length) {
                            return IconButton(
                                onPressed: () async {
                                  showTheBottom();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ));
                          }
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Chip(
                                  backgroundColor: Colors.orange,
                                  label: Text(genres[index])),
                              GestureDetector(
                                onTap: () {
                                  selGenres.removeAt(index);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: const Icon(
                                    Icons.close,
                                    size: 12,
                                  ),
                                ),
                              )
                            ],
                          );
                        })),
              )
                  : TextField(
                onTap: () async {
                  showTheBottom();
                },
                readOnly: true,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.orange,
                decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.arrow_downward_sharp,
                      color: Colors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white))),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('Performance Type',
                      style: TextStyle(color: Colors.white))
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                          const BorderSide(color: Colors.orange)),
                      activeColor: Colors.orange,
                      checkColor: Colors.black,
                      value: this.valueFirst,
                      onChanged: (bool? value) {
                        setState(() {
                          this.valueFirst = value!;
                        });
                      }),
                  const Text(
                    'In Process   ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                          const BorderSide(color: Colors.orange)),
                      activeColor: Colors.orange,
                      checkColor: Colors.black,
                      value: this.valueSecond,
                      onChanged: (bool? value) {
                        setState(() {
                          this.valueSecond = value!;
                        });
                      }),
                  const Text(
                    'Virtual   ',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(onPressed:(){},
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  minimumSize: const Size.fromHeight(50.0)
                ),
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

