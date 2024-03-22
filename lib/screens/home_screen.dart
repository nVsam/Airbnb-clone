import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../shared/theme/colors.dart';
import '../screens/booking_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 128,
        flexibleSpace: Container(
          child: Stack(
            children: [
              // const Positioned(
              //   bottom: 0.0,
              //   left: 0.0,
              //   right: 0.0,
              //   child: PropertyTypeList()
              //   ),
              Positioned(
                top: 70.0,
                right: 8.0,
                child: IconButton(
                  onPressed: () {}, 
                  icon: const Icon(Icons.tune)
                  ),
                ),
              Positioned(
                left: 16.0,
                right: 72.0,
                top: 64.0,
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed('booking-details');
                  },
                  child: Hero(
                    tag: 'search',
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: appWhite,
                        border: Border.all(
                          color: appGrey,
                          width: 1.0
                        ),
                        borderRadius: BorderRadius.circular(32.0),
                    
                        boxShadow: [
                          BoxShadow(
                            color: appGrey.withOpacity(0.5),
                            blurRadius: 8.0,
                            spreadRadius: 8.0,
                            offset: const Offset(0.0, 4.0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Para onde?',
                                style: textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Qualquer lugar ° Qualquer semana',
                                style: textTheme.bodyMedium,
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  ),
                ),
              )
            ],
          ), 
        ),
      ),
      body: Container(),
    );
  }
}