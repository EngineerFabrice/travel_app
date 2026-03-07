import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAED0E4),
      appBar: AppBar(
        title: const Text("Select Flight"),
        backgroundColor: const Color(0xFFAED0E4),
        elevation: 0,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// FROM / TO
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _airportBox("JKT", "Jakarta, INA"),
                const Icon(Icons.swap_horiz, size: 30),
                _airportBox("SBY", "Surabaya, INA"),
              ],
            ),

            const SizedBox(height: 25),

            /// DEPARTURE DATE
            _inputField(
              icon: Icons.calendar_today,
              hint: "Departure Date",
            ),

            const SizedBox(height: 15),

            /// RETURN DATE
            _inputField(
              icon: Icons.calendar_today,
              hint: "Return Date",
              trailing: Switch(
                value: true,
                onChanged: (v) {},
              ),
            ),

            const SizedBox(height: 15),

            /// PASSENGER
            _inputField(
              icon: Icons.person,
              hint: "Passenger",
              trailing: const Text("Adult"),
            ),

            const SizedBox(height: 15),

            /// CABIN CLASS
            _inputField(
              icon: Icons.airline_seat_recline_extra,
              hint: "Cabin Class",
            ),

            const SizedBox(height: 30),

            /// SEARCH BUTTON
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "SEARCH",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "My List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My Account",
          ),
        ],
      ),
    );
  }

  /// AIRPORT BOX
  Widget _airportBox(String code, String city) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            code,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            city,
            style: const TextStyle(fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// INPUT FIELD
  Widget _inputField({
    required IconData icon,
    required String hint,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}