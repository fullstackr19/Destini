import 'package:flutter/material.dart';
// import 'story.dart';
import 'story_brain.dart';

void main() {
  runApp(Destini());
}

StoryBrain storyBrain = new StoryBrain();

class Destini extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destini',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String userChoice = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Text('🔮 Destini', style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),),
                ),
              ],
            ),
            Expanded(
              flex: 12,
              child: Center(
                child: Text(storyBrain.getStory(), style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white
                ),),
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    userChoice = storyBrain.getChoice1();
                    storyBrain.nextStory(1);
                  });
                },
                child: Text('choice 1', style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.cyan,
                ),),
                color:  Colors.blueGrey[800],
              ),
            ), 
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    userChoice = storyBrain.getChoice2();
                    storyBrain.nextStory(2);
                  });
                },
                child: Text('choice 2', style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red[400],
                ),),
                color: Colors.blueGrey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}