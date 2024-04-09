import 'dart:ui';

import 'package:airbnb/models/booking_steps.dart';
import 'package:airbnb/shared/theme/colors.dart';
import 'package:airbnb/widgets/select_date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../widgets/select_destination_widget.dart';
import '../widgets/select_guests_widget.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  var step = BookingStep.selectDate;
  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: Scaffold(
        backgroundColor: appWhite.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.close)
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {}, 
                child: Text(
                  'Stays',
                  style: TextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {}, 
                child: Text(
                  'Experiences',
                  style: TextTheme.titleMedium,
                ),
              ),
            ],
          ),
          actions: const [SizedBox(width: 48.0)],
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    step = BookingStep.selectDestination;
                  });
                },
                child: Hero(
                  tag: 'search',
                  child: SelectDestinationWidget(step: step),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    step = BookingStep.selectDate;
                  });
                },
                child: SelectDateWidget(step: step),
              ),
              (step == BookingStep.selectDate) 
              ? const SizedBox() 
              : GestureDetector(
                onTap: () {
                  setState(() {
                    step = BookingStep.selectGuests;
                  });
                },
                child: SelectGuestsWidget(step: step),
              ),
            ],
          ),
        ),
      ),
    );
  }
}