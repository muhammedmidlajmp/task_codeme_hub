import 'package:code_me_hub/controller/provider/fetch_data_provider/fectch_data_provider.dart';
import 'package:code_me_hub/model/lead_data_model/lead_data_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LeadListScreen extends StatelessWidget {
  const LeadListScreen({Key? key});

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
        body: FutureBuilder<LeadListResponse>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Lead> leads = snapshot.data?.data.leads ?? [];
              return ListView.builder(
                itemCount: leads.length,
                itemBuilder: (context, index) {
                  Lead lead = leads[index];
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
                                  '01', // You can use lead.id.toString()
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                lead.name,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Color.fromARGB(255, 16, 39, 220)),
                              ),
                              Text(
                                lead.email,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 12),
                              ),
                              Text(
                                'created : ${lead.createdAt.toLocal()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 12),
                              ),
                              Text(
                                'Mob: ${lead.mobile}',
                                style: const TextStyle(
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
                              lead.interest,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w800),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: Text(lead.location),
                                ),
                                const Padding(
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
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: SizedBox(
            width: 100,
            child: const Row(children: [Icon(Icons.add), Text('Add lead')])),
        ),
      ),
    );
  }
}
