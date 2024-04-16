import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/glass_title.dart';

class ComplaintsView extends StatefulWidget {
  @override
  _ComplaintsViewState createState() => _ComplaintsViewState();
}

class _ComplaintsViewState extends State<ComplaintsView> {
  int _currentIndex = 1;
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              // Adjust the path to your image
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Glassmorphic title
        const Positioned(
          left: 16,
          right: 16,
          top: 10,
          child: GlassTitle(title: 'COMPLAINTS'), // Use the GlassTitle widget
        ),
        // Content
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // Your content widgets go here
          ),
        ),
        // Floating action button
        Positioned(
          bottom: _showForm ? 0 : 16,
          // Adjust bottom position based on whether the form is shown
          right: 16,
          child: _showForm
              ? SizedBox() // Return SizedBox if form is shown
              : FloatingActionButton(
            onPressed: () {
              setState(() {
                _showForm = true;
              });
            },
            child: Icon(Icons.add),
          ),
        ),
        // Bottom navigation bar
        Positioned(
          left: 16,
          right: 16,
          bottom: 16, // Adjust bottom position as needed
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
    );
  }
}
