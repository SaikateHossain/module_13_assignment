import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of item quantities for each item
  List<int> itemQuantities = [0, 0, 0];

  // List of images for each item
  List<String> itemImages = [
    'assets/images/Pullover.jpg',
    'assets/images/T-Shirt.jpg',
    'assets/images/Sport_Dress.jpg'
  ];

  // List of names for each item (can match image names or be custom)
  List<String> itemNames = ['Pullover', 'T-Shirt', 'Sport Dress'];

  // List of colors for each item
  List<String> itemColors = ['Black', 'Gray', 'Black'];

  // List of sizes for each item
  List<String> itemSizes = ['L', 'L', 'M'];

  // List of prices for each item
  List<int> itemPrices = [51, 30, 43];

  // Method to calculate the total amount based on quantities and prices
  int calculateTotalAmount() {
    int total = 0;
    for (int i = 0; i < itemQuantities.length; i++) {
      total += itemQuantities[i] * itemPrices[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'My Bag',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        // centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itemQuantities.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First section: Dynamic Image
                      Image.asset(
                        itemImages[index], // Load the image based on the index
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20),

                      // Second section: Title, Subtitle, Buttons
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display dynamic title based on the item name
                            Text(
                              itemNames[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),

                            // Display 'Color' and 'Size' in a single Row
                            Row(
                              children: [
                                const Text(
                                  'Color: ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  itemColors[index],
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  'Size: ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Text(
                                  itemSizes[index],
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),

                            // Row for quantity increment and decrement buttons
                            Row(
                              children: [
                                // CircleAvatar for decrement button with drop shadow
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 6,
                                        offset: const Offset(0, 2), // Drop shadow
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      icon: const Icon(Icons.remove),
                                      color: Colors.grey, // Icon color set to gray
                                      onPressed: () {
                                        setState(() {
                                          if (itemQuantities[index] > 0) {
                                            itemQuantities[index]--;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 8.0),

                                Text('${itemQuantities[index]}'),
                                // Display current quantity

                                const SizedBox(width: 8.0),

                                // CircleAvatar for increment button with drop shadow
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 6,
                                        offset: const Offset(0, 2), // Drop shadow
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      icon: const Icon(Icons.add),
                                      color: Colors.grey, // Icon color set to gray
                                      onPressed: () {
                                        setState(() {
                                          itemQuantities[index]++;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Third section: Popup Menu and Dynamic Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          // 3-dot menu with icon color changed to gray
                          PopupMenuButton<int>(
                            icon: const Icon(Icons.more_vert, color: Colors.grey),
                            // Set the 3-dot icon color to gray
                            onSelected: (value) {
                              // Add functionality here if needed
                            },
                            itemBuilder: (context) => [],
                          ),

                          const SizedBox(height: 16.0),

                          // Display dynamic price based on the index
                          Text(
                            '\$${itemPrices[index]}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],

                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Section to display the total amount
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Set the text 'Total Amount' to gray
                const Text(
                  'Total amount:',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                // Set the value (total price) to black
                Text(
                  '\$${calculateTotalAmount()}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),

          // Checkout button at the bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Congratulations! Your order is successful.'),
                    ),
                  );
                },
                child: const Text(
                  'CHECK OUT',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}