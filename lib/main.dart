import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp Slicing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff128C7E),
        title: Text("WhatsApp"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
        elevation: 0.0,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              color: Color(0xff128C7E),
              child: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(child: Text("CHATS")),
                  Tab(child: Text("STATUS")),
                  Tab(child: Text("CALLS")),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ChatView(),
                  StatusView(),
                  CallView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message),
        backgroundColor: Color(0xff128C7E),
      ),
      body: ListView.separated(
        itemBuilder: (c, i) => _item(),
        separatorBuilder: (c, i) => SizedBox(height: 16.0),
        itemCount: 10,
      ),
    );
  }

  _item() {
    return ListTile(
      leading: CircleAvatar(),
      //profile photo
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Kontak",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Yesterday",
              style: TextStyle(fontSize: 12.0, color: Colors.grey)),
        ],
      ),
      // sender name
      subtitle: Text(
        "Long Message Long MessageLong MessageLong MessageLong MessageLong MessageLong MessageLong Message",
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

class StatusView extends StatelessWidget {
  const StatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(Icons.edit, color: Colors.blueGrey),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xff128C7E),
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(),
            title: Text(
              "My Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Tap to add status update"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Recent updates",
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (c, i) => _item(),
            separatorBuilder: (c, i) => SizedBox(height: 16.0),
            itemCount: 12,
          ),
        ],
      ),
    );
  }

  _item() {
    return ListTile(
      leading: CircleAvatar(),
      title: Text("Nama teman"),
      subtitle: Text("1 minute ago"),
    );
  }
}

class CallView extends StatelessWidget {
  const CallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Color(0xff128C7E),
        child: Icon(Icons.add_ic_call),
      ),
      body: ListView.separated(
        itemBuilder: (c, i) => _item(),
        separatorBuilder: (c, i) => SizedBox(height: 16.0),
        itemCount: 20,
      ),
    );
  }

  _item() {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(
        "Nama teman",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.call_made, color: Colors.red),
          SizedBox(width: 4.0),
          Text("1 minute ago"),
        ],
      ),
      trailing: Icon(Icons.call, color: Colors.green),
    );
  }
}
