import 'package:flutter/material.dart';

class AddPodcasts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  hintText: 'Search for a podcast...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      print("something");
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 130.0,
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Image.network(
                                      "https://images.theabcdn.com/i/24025650.jpg"),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Text("Some Author/production name")),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text("Some titile $index"),
                              subtitle: Text(
                                  "Some text that describes the podcast but should probably limit this section to limited number of words."),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
