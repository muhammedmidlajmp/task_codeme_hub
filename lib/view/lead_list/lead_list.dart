import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LeadListScreen extends StatelessWidget {
  const LeadListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: const Text('Lead List'),
          leading: const Icon(Icons.list_outlined),
          actions: [const Icon(Icons.notifications)],
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                height: 15.h,
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 163, 200, 230),
                        ),
                        child: const Center(
                          child: Text(
                            '01',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'David Murguili',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(255, 16, 39, 220)),
                        ),
                        Text(
                          'example@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Text(
                          'created : 05/03/2023',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                        Text(
                          'Mob: 9742588812',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Container(
                      height: 4.h,
                      width: 14.w,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 163, 200, 230),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        'Flutter',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w800),
                      )),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            child: Text('Calicut'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 15),
                            child: Icon(
                              Icons.phone_in_talk,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
