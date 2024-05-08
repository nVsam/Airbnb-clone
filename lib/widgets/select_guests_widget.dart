import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/booking_steps.dart';

class SelectGuestsWidget extends StatelessWidget {
  const SelectGuestsWidget({super.key, required this.step});

  final BookingStep step;

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        height: step == BookingStep.selectGuests ? 274 : 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        duration: const Duration(milliseconds: 200),
        child: step == BookingStep.selectGuests
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quem está vindo?',
            style: TextTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 190,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  _buildGuestsQuantitySelector(
                    context,
                    'Adultos',
                    '13 anos ou mais',
                    () {},
                    () {},
                    '0',
                  ),
                  const Divider(),
                  _buildGuestsQuantitySelector(
                    context,
                    'Crianças',
                    'De 2 a 12 anos',
                    () {},
                    () {},
                    '0',
                  ),
                  const Divider(),
                  _buildGuestsQuantitySelector(
                    context,
                    'Bebês',
                    'Menor de 2',
                    () {},
                    () {},
                    '0',
                  ),
                  const Divider(),
                  _buildGuestsQuantitySelector(
                    context,
                    'Animais de estimação',
                    'Vai levar um animal de serviço?',
                    () {},
                    () {},
                    '0',
                  ),
                ],
              ),
            )
          ],
        )
        .animate(delay: const Duration(milliseconds: 200))
        .fadeIn(duration: const Duration(milliseconds: 200))
        : Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Quem',
              style: TextTheme.bodyMedium,
            ),
            Text('Adicionar hospedes',
            style: Theme.of(context)
            .textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }

  Container _buildGuestsQuantitySelector(
    BuildContext context,
    String title,
    String subtitle,
    VoidCallback onDecrement,
    VoidCallback onIncrement,
    String value,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.bodyLarge),
              Text(subtitle, style: textTheme.bodySmall),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDecrement, 
                icon: const Icon(Icons.remove),
                ),
              Text(
                value,
                style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: onIncrement, 
                icon: const Icon(Icons.add),
                ),
            ],
          )
        ],
      )
    );
  }
}