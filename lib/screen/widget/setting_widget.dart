import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/data/provider/scheduling_provider.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Settings', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Consumer<SchedulingProvider>(
            builder: (context, provider, child) {
              return SwitchListTile(
                title: const Text('Daily Reminder'),
                subtitle: const Text('Enable notification at 11:00 AM'),
                value: provider.isScheduled,
                onChanged: (value) async {
                  provider.scheduledRestaurant(value);
                },
              );
            },
          ),
          Consumer<SchedulingProvider>(
            builder: (context, provider, child) {
              return SwitchListTile(
                title: const Text('Random Restaurant Notification'),
                subtitle: const Text('Enable notification at random time'),
                value: provider.isRandomRestaurantNotification,
                onChanged: (value) async {
                  provider.getRandomRestaurantNotification(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
