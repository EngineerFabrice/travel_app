import 'package:flutter/material.dart';

import '../models/destination.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_button.dart';

class BookScreen extends StatefulWidget {
  final Destination destination;

  const BookScreen({super.key, required this.destination});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController specialRequestController =
      TextEditingController();
  DateTime? selectedInDate;
  DateTime? selectedOutDate;
  int nights = 1;
  int guests = 1;
  String selectedRoom = 'Standard Room';

  //Room Prices
  Map<String, double> roomPrices = {
    'Standard Room': 120,
    'Deluxe Room': 180,
    'Family Room': 200,
    'Single Room': 100,
    'Double Room': 150,
    'Twin Room': 170,
    'Suite': 300,
  };

  //Get Total Amount per night
  double getTotalAmountPerNight() {
    return roomPrices[selectedRoom] ?? widget.destination.price;
  }

  //Get Total Amount
  double getTotalAmount() {
    int night = 1;

    if (selectedOutDate != null && selectedInDate != null) {
      night = selectedOutDate!.difference(selectedInDate!).inDays;

      if (night <= 0) night = 1;
    }

    double roomTotalPrice =
        roomPrices[selectedRoom] ?? widget.destination.price;
    return roomTotalPrice * guests * night;
  }

  //Reset Form
  void resetForm() {
    _formKey.currentState?.reset();

    setState(() {
      selectedInDate = null;
      selectedOutDate = null;
      guests = 1;
      nights = 1;
      selectedRoom = 'Standard Room';
    });
    specialRequestController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Book Your Stay"))),

      // leading: IconButton(
      //  // icon: const Icon(Icons.arrow_back),
      //   onPressed: () => Navigator.pop(context),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Booking Summary Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryColor, AppTheme.accentColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.destination.imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.destination.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.destination.location,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Divider(color: Colors.white30),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Price per night',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          '\$${getTotalAmountPerNight().toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Booking Form
              const Text(
                'Booking Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 15),

              // Check-in Date
              const Text(
                'Check-in Date',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedInDate ?? DateTime.now(),
                    firstDate: selectedInDate ?? DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() {
                      selectedInDate = date;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: AppTheme.shadowColor, blurRadius: 5),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        selectedInDate != null
                            ? '${selectedInDate!.day}/${selectedInDate!.month}/${selectedInDate!.year}'
                            : 'Select date',
                        style: TextStyle(
                          color: selectedInDate != null
                              ? AppTheme.textPrimary
                              : AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Check-out Date
              const Text(
                'Check-out Date',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() {
                      selectedOutDate = date;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: AppTheme.shadowColor, blurRadius: 5),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        selectedOutDate != null
                            ? '${selectedOutDate!.day}/${selectedOutDate!.month}/${selectedOutDate!.year}'
                            : 'Select date',
                        style: TextStyle(
                          color: selectedOutDate != null
                              ? AppTheme.textPrimary
                              : AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Number of Guests
              const Text(
                'Number of Guests',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: AppTheme.shadowColor, blurRadius: 5),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.people, color: AppTheme.primaryColor),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Decrement button
                          IconButton(
                            onPressed: () {
                              if (guests > 1) {
                                setState(() {
                                  guests--;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          // Display current guests
                          Text(
                            '$guests',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Increment button
                          IconButton(
                            onPressed: () {
                              setState(() {
                                guests++;
                              });
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Room Type
              const Text(
                'Room Type',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: AppTheme.shadowColor, blurRadius: 5),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedRoom,
                  decoration: const InputDecoration(border: InputBorder.none),
                  items:
                      [
                            'Standard Room',
                            'Deluxe Room',
                            'Suite',
                            'Family Room',
                            'Single Room',
                            'Double Room',
                            'Twin Room',
                          ]
                          .map(
                            (room) => DropdownMenuItem(
                              value: room,
                              child: Text(room),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRoom = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 15),

              // Special Requests
              const Text(
                'Special Requests',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: AppTheme.shadowColor, blurRadius: 5),
                  ],
                ),
                child: TextField(
                  controller: specialRequestController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Any special requests?',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Total Price
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: AppTheme.shadowColor, blurRadius: 5),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '\$${getTotalAmount().toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Confirm Button
              CustomButton(
                text: 'Confirm Booking',
                onPressed: () {
                  if (selectedOutDate != null && selectedInDate != null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Booking Confirmed!'),
                        content: const Text(
                          'Your booking has been successfully confirmed. Check your email for details.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close dialog
                              resetForm(); //Reset booking form

                              // Navigator.pop(context); // Back to Detail
                              // Navigator.pop(context); // Back to Home
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please select a check-in date'),
                        backgroundColor: AppTheme.secondaryColor,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }
                },
                icon: Icons.check_circle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    specialRequestController.dispose();
    super.dispose();
  }
}
