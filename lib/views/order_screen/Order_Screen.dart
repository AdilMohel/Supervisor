import 'package:flutter/material.dart';
import 'package:supervisior_anbar/consts/colors.dart';
import 'package:supervisior_anbar/views/order_screen/components/top_button.dart';
import 'package:supervisior_anbar/widget_common/commen_header.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // Variable to track which content to display
  String selectedBooking = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            SizedBox(height: 10),
            _buildButtonRow(),
            SizedBox(height: 20),
            _buildContentBasedOnSelection(),
          ],
        ),
      ),
    );
  }


  Widget _buildButtonRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          OrderButtons(
            currentBooking: currentbooking,
            primaryColor: primaryColor,
            whiteColor: whiteColor,
            fontFamily: regular,
            onTap: () => _updateSelectedBooking(currentbooking),
          ),
          OrderButtons(
            currentBooking: upcomingbooking,
            primaryColor: lightblue,
            whiteColor: whiteColor,
            fontFamily: regular,
            onTap: () => _updateSelectedBooking(upcomingbooking),
          ),
          OrderButtons(
            currentBooking: assignbook,
            primaryColor: lightpurple,
            whiteColor: whiteColor,
            fontFamily: regular,
            onTap: () => _updateSelectedBooking(assignbook),
          ),
        ],
      ),
    );
  }

  void _updateSelectedBooking(String booking) {
    print("Selected Booking: $booking");  // Debug statement
    setState(() {
      selectedBooking = booking;
    });
  }

  Widget _buildContentBasedOnSelection() {
    print("Building content for: $selectedBooking");  // Debug statement
    switch (selectedBooking) {
      case currentbooking:
        return Text('Displaying current bookings',
            style: TextStyle(color: blackColor, fontSize: 20, fontFamily: bold));
      case upcomingbooking:
        return Text('Displaying upcoming bookings',
            style: TextStyle(color: blackColor, fontSize: 20, fontFamily: bold));
      case assignbook:
        return Text('Displaying assigned bookings',
            style: TextStyle(color: blackColor, fontSize: 20, fontFamily: bold));
      default:
        return SizedBox(height: 100);  // Default case shows an empty space for clarity
    }
  }
}
