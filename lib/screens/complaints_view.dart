import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/civic_form.dart';
import '../widgets/glass_title.dart';
import '../widgets/tracking_card.dart';

class ComplaintsView extends StatefulWidget {
  @override
  _ComplaintsViewState createState() => _ComplaintsViewState();
}

class _ComplaintsViewState extends State<ComplaintsView> {
  int _currentIndex = 1;
  bool _showForm = false; // Initially set to false

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Glassmorphic title serving as app bar
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: GlassTitle(title: 'MY COMPLAINTS'), // Use the GlassTitle widget
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // "In Progress" Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.circle_rounded, color: Colors.blue), // Icon in blue color
                              SizedBox(width: 8),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'In Progress',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue), // Text in blue color
                                    ),
                                    Text('Ticket #10'),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8),
                          Row(
                            children: [
                              // Picture on left
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.red, // Placeholder color
                                // Your picture widget here
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Road (Broken Road) at Purok #2',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'We need help to fix this road right now, it causes traffic. We’re gonna be late. charot',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black), // Add black border
                                  borderRadius: BorderRadius.circular(10), // Add border radius
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle withdraw button press
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded shape
                                  ),
                                  child: Text('Withdraw'),
                                ),
                              ),
                              SizedBox(width: 8),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black), // Add black border
                                  borderRadius: BorderRadius.circular(10), // Add border radius
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle track button press
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Tracking Information"),
                                          content: TrackingCard(), // Display the TrackingCard widget inside the AlertDialog
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(); // Close the AlertDialog
                                              },
                                              child: Text("Close"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded shape
                                  ),
                                  child: Text('Track'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // "Resolved" Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green), // Icon in green color
                              SizedBox(width: 8),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Resolved',
                                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold), // Text in green color and bold
                                    ),
                                    Text('Ticket No . #5'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              // Picture on left
                              Container(
                                width: 100,
                                height: 100,
                                color: Colors.grey, // Placeholder color
                                // Your picture widget here
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'On Thu, 25 March',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Tree (Fallen Tree) at Purok #2\n3 trees fell down because a car bang against it earlier and now it causes traffic.\n',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.check_circle, color: Colors.green),
                                SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    'Your complaint was successfully resolved by the barangay tanod.',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black), // Add black border
                                  borderRadius: BorderRadius.circular(10), // Add border radius
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle withdraw button press
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded shape
                                  ),
                                  child: Text('Withdraw'),
                                ),
                              ),
                              SizedBox(width: 8),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4, // Adjust width as needed
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black), // Add black border
                                  borderRadius: BorderRadius.circular(10), // Add border radius
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle track button press
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded shape
                                  ),
                                  child: Text('Track'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Civic form
          if (_showForm)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _showForm = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: CivicForm(
                    onSubmit: () {
                      setState(() {
                        _showForm = false;
                      });
                    },
                  ),
                ),
              ),
            ),
          // Floating action button
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15, // Adjust position based on screen height
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _showForm = true; // Set _showForm to true when button is clicked
                });
              },
              backgroundColor: Colors.blue, // Set background color to blue
              child: Icon(Icons.edit, color: Colors.white), // Set icon color to white
              shape: CircleBorder(), // Set shape to circular
              heroTag: null, // Set hero tag to null to prevent duplicate hero tag errors
              elevation: 5, // Add elevation for a shadow effect
              mini: false, // Make the button normal size
            ),
          ),
          // Bottom navigation bar
          Positioned(
            left: 20,
            right: 20,
            bottom: 20, // Adjust bottom position as needed
            child: BottomBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
