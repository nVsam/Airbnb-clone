import 'package:airbnb/shared/theme/colors.dart';
import 'package:airbnb/widgets/app_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/booking_steps.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key, required this.step});

  final BookingStep step;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    var expandedHeight = size.height - 112 - 60 - 32 - 20;
    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        height: step == BookingStep.selectDate ? expandedHeight : 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        duration: const Duration(milliseconds: 300),
        child: step == BookingStep.selectDate ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quando é a sua viagem?',
              style:
                Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            ),
            const SizedBox(height: 16.0),
            const Row(
              children: [
                Expanded(child: CalendarOptionSegmentedButton()),
              ],
            ),
            const AppCalendar(),
            const Spacer(),
            const Divider(),
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  OutlinedButton(
                    onPressed: () {}, 
                    child: const Text('Datas exatas'),
                  ),
                  const SizedBox(width: 8.0),
                  OutlinedButton(
                    onPressed: () {}, 
                    child: const Text('± 1 dia'),
                  ),
                  const SizedBox(width: 8.0),
                  OutlinedButton(
                    onPressed: () {}, 
                    child: const Text('± 2 dias'),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {}, 
                  child: const Text('Redefinir'),
                ),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: appRed,
                    minimumSize: const Size(120, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Próximo'),
                ),
              ],
            ),
          ],
        )
        .animate(delay: const Duration(milliseconds: 300))
        .fadeIn(duration: const Duration(milliseconds: 300))
      : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quando',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'Busca flexível',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      )
      ),
    );
  }
}