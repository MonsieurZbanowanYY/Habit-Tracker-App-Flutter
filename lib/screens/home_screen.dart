import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitmate/blocs/selected_day_cubit.dart';
import 'package:habitmate/config/constraint.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GetIt getIt = GetIt.instance;
final tr = getIt.get<AppLocalizations>();
final locale = getIt.get<Locale>();
const Radius defaultBorderRadius = Radius.circular(15);
List events = [
  DateTime.utc(2023, 9, 1),
  DateTime.utc(2023, 9, 2),
  DateTime.utc(2023, 9, 4),
  DateTime.utc(2023, 9, 5),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: themeData.colorScheme.background,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],
          title: Text(
            tr.app_name,
            style: themeData.textTheme.bodyLarge?.copyWith(
              fontFamily: 'Montserrat',
              color: themeData.colorScheme.primary,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: BlocProvider(
            create: (context) => SelectedDayCubit(),
            child: Padding(
              padding: defaultHorizontalViewPadding,
              child: ListView(
                children: const [
                  CalendarHabits(),
                  HabitItem(
                    title: 'Read a book',
                    icon: Icons.book,
                    description: 'Finished',
                    iconDescription: Icons.check_circle,
                  ),
                  // go for a walk
                  HabitItem(
                    title: 'Go for a walk',
                    icon: Icons.directions_walk,
                    description: 'New',
                    iconDescription: Icons.star,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CalendarHabits extends StatelessWidget {
  const CalendarHabits({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedDayCubit, DateTime>(
      builder: (context, selectedDay) {
        return TableCalendar(
          locale: locale.toString(),
          firstDay: DateTime.utc(2023, 01, 01),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: selectedDay,
          pageJumpingEnabled: true,
          calendarFormat: CalendarFormat.week,
          calendarStyle: const CalendarStyle(
            weekendTextStyle: TextStyle(),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekendStyle: TextStyle(color: Color(0xFF4F4F4F)),
          ),
          selectedDayPredicate: (day) {
            return isSameDay(selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            context.read<SelectedDayCubit>().changeSelectedDay(selectedDay);
          },
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
          calendarBuilders: CalendarBuilders(
            outsideBuilder: (context, day, focusedDay) {
              if (events.contains(day)) {
                return CalendarEventDay(day: day);
              }
              return null;
            },
            defaultBuilder: (context, day, focusedDay) {
              if (events.contains(day)) {
                return CalendarEventDay(day: day);
              }
              return null;
            },
            todayBuilder: (context, day, focusedDay) {
              return CalendarTodayDay(day: day);
            },
            selectedBuilder: (context, day, focusedDay) {
              return CalendarSelectedDay(day: day);
            },
            dowBuilder: (context, day) {
              final text = DateFormat.E(locale.toString()).format(day);
              if (isSameDay(day, selectedDay) || isSameDay(day, selectedDay)) {
                return CalendarDow(day: day, text: text);
              }
              if (isSameDay(day, DateTime.now())) {
                return CalendarDowSameDay(text: text);
              }
              return null;
            },
          ),
        );
      },
    );
  }
}

class CalendarEventDay extends StatelessWidget {
  final DateTime day;
  const CalendarEventDay({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.inversePrimary,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(
          DateFormat.d(locale.toString()).format(day),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class CalendarSelectedDay extends StatelessWidget {
  final DateTime day;
  const CalendarSelectedDay({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: isSameDay(DateTime.now(), day)
            ? themeData.colorScheme.primary
            : themeData.colorScheme.surfaceVariant,
        borderRadius: const BorderRadius.only(
          bottomLeft: defaultBorderRadius,
          bottomRight: defaultBorderRadius,
        ),
      ),
      child: Center(
        child: Text(
          DateFormat.d(locale.toString()).format(day),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class CalendarTodayDay extends StatelessWidget {
  final DateTime day;
  const CalendarTodayDay({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(defaultBorderRadius.x),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(
          DateFormat.d(locale.toString()).format(day),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class CalendarDow extends StatelessWidget {
  final DateTime day;
  final String text;
  const CalendarDow({super.key, required this.day, required this.text});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: isSameDay(DateTime.now(), day)
            ? themeData.colorScheme.primary
            : themeData.colorScheme.surfaceVariant,
        borderRadius: const BorderRadius.only(
          topLeft: defaultBorderRadius,
          topRight: defaultBorderRadius,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CalendarDowSameDay extends StatelessWidget {
  final String text;
  const CalendarDowSameDay({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: themeData.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class HabitItem extends StatefulWidget {
  final String title;
  final String? description;
  final IconData icon;
  final IconData? iconDescription;
  const HabitItem(
      {super.key,
      required this.title,
      this.description,
      required this.icon,
      this.iconDescription});

  @override
  State<HabitItem> createState() => _HabitItemState();
}

class _HabitItemState extends State<HabitItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: defaultTopPadding / 2,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: Container(
          decoration: BoxDecoration(
            color: themeData.colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      widget.icon,
                      color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: themeData.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                        widget.description == null
                            ? Container()
                            : Row(
                                children: [
                                  Icon(
                                    widget.iconDescription,
                                    color: themeData.colorScheme.primary,
                                    size: 15,
                                  ),
                                  Text(
                                    widget.description!,
                                    style:
                                        themeData.textTheme.bodySmall?.copyWith(
                                      color: themeData.colorScheme.primary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // TODO: CHANGE TO BLOC
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: Icon(
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isExpanded
                    ? Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisl eget nunc aliquam aliquet. Nulla facilisi. Donec euismod, nisl eget aliquet aliquam, nisl nisl aliquam nisl, vitae aliquam nisl nisl vitae nisl. Donec euismod, nisl eget aliquet aliquam, nisl nisl aliquam nisl, vitae aliquam nisl nisl vitae nisl.',
                        key: Key('test'),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Martin Gogołowicz || SobGOG || 01.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 01.09.2023
