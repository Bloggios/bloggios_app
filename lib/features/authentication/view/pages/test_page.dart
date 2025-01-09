/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: test_page
 */

import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Height Tab Views'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section 1: Container with a column inside it
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blue[100],
              child: Column(
                children: [
                  Text(
                    'Section 1: Column with Multiple Children',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Child 1'),
                  Text('Child 2'),
                  Text('Child 3'),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Section 2: Tabs
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Signup'),
              ],
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
            ),
            SizedBox(height: 16),

            // Section 3: Tab Views with dynamic height
            AnimatedBuilder(
              animation: _tabController.animation!,
              builder: (context, child) {
                int index = _tabController.index;
                return IndexedStack(
                  index: index,
                  children: [
                    // Login Tab View
                    Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.green[100],
                      child: Column(
                        children: [
                          Text(
                            'Login View Content',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 50),
                          Text('Additional content for Login'),
                        ],
                      ),
                    ),
                    // Signup Tab View
                    Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.orange[100],
                      child: Column(
                        children: [
                          Text(
                            'Signup View Content',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 150),
                          Text('Additional content for Signup'),
                          Text(
                            'Signup View Content',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 150),
                          Text('Additional content for Signup'),
                          Text(
                            'Signup View Content',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 150),
                          Text('Additional content for Signup'),
                          Text(
                            'Signup View Content',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 150),
                          Text('Additional content for Signup'),
                          Text(
                            'Signup View Content',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 150),
                          Text('Additional content for Signup'),
                          Text(
                            'Signup View Content',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 150),
                          Text('Additional content for Signup'),
                          Text(
                            'Signup View Content',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 150),
                          Text('Additional content for Signup'),
                          Text(
                            'Signup View Content',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 150),
                          Text('Additional content for Signup'),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _fadeInDataWidget() {
//   Widget content;
//
//   if (_selectedIndex == 0) {
//     content = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       key: ValueKey('Matrimony'),
//       children: [
//         Text(
//           'Matrimony Feature 1',
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.black87,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(height: 10),
//         Text(
//           'Matrimony Feature 2',
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.black54,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   } else if (_selectedIndex == 1) {
//     content = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       key: ValueKey('Dating'), // Unique key for smooth transition
//       children: [
//         Text(
//           'Dating Feature 1',
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.black87,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         SizedBox(height: 10),
//         Text(
//           'Dating Feature 2',
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.black54,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   } else {
//     // None selected
//     content = Column(
//       key: ValueKey('None'), // Unique key for smooth transition
//       children: [
//         Text(
//           'Please select a feature to proceed.',
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.grey,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ],
//     );
//   }
//
//   return AnimatedSwitcher(
//     duration: Duration(milliseconds: 200), // Animation duration
//     transitionBuilder: (Widget child, Animation<double> animation) {
//       return FadeTransition(
//         opacity: animation,
//         child: child,
//       );
//     },
//     child: content,
//   );
// }