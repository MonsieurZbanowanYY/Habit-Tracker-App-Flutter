import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitmate/blocs/selected_day_cubit.dart';
import 'package:habitmate/config/constraint.dart';
import 'package:habitmate/models/habit_model.dart';
import 'package:habitmate/models/selected_day_model.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GetIt getIt = GetIt.instance;
final tr = getIt.get<AppLocalizations>();
final locale = getIt.get<Locale>();
const Radius defaultBorderRadius = Radius.circular(15);
List events = [
  DateTime.utc(2023, 8, 3),
  DateTime.utc(2023, 8, 15),
  DateTime.utc(2023, 8, 28),
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
                children: [
                  const CalendarHabits(),
                  BlocBuilder<SelectedDayCubit, SelectedDay>(
                    builder: (context, selectedDay) {
                      List<Habit> habitsToShow = selectedDay.habits;
                      habitsToShow = habitsToShow.where((element) {
                        if (element.onlyOn.isEmpty) {
                          return true;
                        }
                        return element.onlyOn
                            .contains(selectedDay.selectedDay.weekday);
                      }).toList();
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: habitsToShow.length,
                        itemBuilder: (context, index) {
                          Habit habit = habitsToShow[index];
                          return HabitItem(
                            title: habit.name,
                            icon: habit.icon,
                            description: habit.isDone ? tr.finished : tr.to_do,
                            iconDescription:
                                habit.isDone ? Icons.check_circle : Icons.star,
                            index: index,
                          );
                        },
                      );
                    },
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
    return BlocBuilder<SelectedDayCubit, SelectedDay>(
      builder: (context, selectedDay) {
        return TableCalendar(
          locale: locale.toString(),
          firstDay: DateTime.utc(2023, 01, 01),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: selectedDay.selectedDay,
          pageJumpingEnabled: true,
          calendarFormat: CalendarFormat.week,
          calendarStyle: const CalendarStyle(
            weekendTextStyle: TextStyle(),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekendStyle: TextStyle(color: Color(0xFF4F4F4F)),
          ),
          daysOfWeekHeight: 20,
          selectedDayPredicate: (day) {
            return isSameDay(selectedDay.selectedDay, day);
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
              if (isSameDay(day, selectedDay.selectedDay) ||
                  isSameDay(day, selectedDay.selectedDay)) {
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

class HabitItemVisible extends StatelessWidget {
  final String title;
  final String? description;
  final IconData icon;
  final IconData? iconDescription;
  final int index;
  const HabitItemVisible({
    super.key,
    required this.title,
    this.description,
    required this.icon,
    this.iconDescription,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: themeData.colorScheme.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: themeData.colorScheme.onPrimary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: themeData.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              description == null
                  ? Container()
                  : Row(
                      children: [
                        Icon(
                          iconDescription,
                          color: themeData.colorScheme.primary,
                          size: 15,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          description!,
                          style: themeData.textTheme.bodySmall?.copyWith(
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
        BlocBuilder<SelectedDayCubit, SelectedDay>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context.read<SelectedDayCubit>().changeHabitExpanded(index);
              },
              icon: Icon(
                state.habits[index].isExpanded
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                color: themeData.colorScheme.primary,
              ),
            );
          },
        ),
      ],
    );
  }
}

class MarkAsDoneButton extends StatefulWidget {
  final int index;
  final SelectedDay state;
  const MarkAsDoneButton({super.key, required this.index, required this.state});

  @override
  State<MarkAsDoneButton> createState() => _MarkAsDoneButtonState();
}

class _MarkAsDoneButtonState extends State<MarkAsDoneButton> {
  late ConfettiController confettiController;
  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void initState() {
    super.initState();
    confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    confettiController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Stack(
      children: [
        ElevatedButton(
          onPressed: () {
            if (!widget.state.habits[widget.index].isDone) {
              confettiController.play();
            }
            context.read<SelectedDayCubit>().changeHabitDone(widget.index);
          },
          child: Text(
            widget.state.habits[widget.index].isDone
                ? tr.undo_habit
                : tr.mark_as_done,
            style: themeData.textTheme.bodyMedium?.copyWith(
              color: themeData.colorScheme.primary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: confettiController,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          colors: [
            themeData.colorScheme.primary,
          ],
          createParticlePath: drawStar,
        ),
      ],
    );
  }
}

class HabitItemCalendarItem extends StatelessWidget {
  final DateTime day;
  const HabitItemCalendarItem({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    String dayString = DateFormat.d(locale.toString()).format(day);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: events.contains(day)
              ? themeData.colorScheme.primary
              : themeData.colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(2),
        child: Center(
          child: Text(
            dayString,
            style: themeData.textTheme.bodyMedium?.copyWith(
              color: events.contains(day)
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class EditHabitButton extends StatelessWidget {
  const EditHabitButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return TextButton(
      onPressed: () {},
      child: Text(
        tr.edit,
        style: themeData.textTheme.bodyMedium?.copyWith(
          color: themeData.colorScheme.primary,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class HabitItemExpanded extends StatelessWidget {
  final int index;
  const HabitItemExpanded({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return BlocBuilder<SelectedDayCubit, SelectedDay>(
      builder: (context, state) {
        return AnimatedSize(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: state.habits[index].isExpanded
              ? Column(
                  children: [
                    const Divider(),
                    TableCalendar(
                      rowHeight: 35,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      locale: locale.toString(),
                      firstDay: DateTime.utc(2023, 01, 01),
                      lastDay: DateTime.now(),
                      focusedDay: // now - month
                          DateTime.now().subtract(
                        const Duration(days: 31),
                      ),
                      headerVisible: false,
                      calendarStyle: const CalendarStyle(
                        cellMargin: EdgeInsets.all(2),
                      ),
                      availableGestures: AvailableGestures.horizontalSwipe,
                      daysOfWeekHeight: 20,
                      calendarBuilders: CalendarBuilders(
                        outsideBuilder: (context, day, focusedDay) {
                          return HabitItemCalendarItem(day: day);
                        },
                        disabledBuilder: (context, day, focusedDay) {
                          return Container();
                        },
                        defaultBuilder: (context, day, focusedDay) {
                          return HabitItemCalendarItem(day: day);
                        },
                        todayBuilder: (context, day, focusedDay) {
                          return HabitItemCalendarItem(day: day);
                        },
                      ),
                    ),
                    const Divider(),
                    Container(
                      child: MediaQuery.of(context).size.width > 350
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  const EditHabitButton(),
                                  MarkAsDoneButton(index: index, state: state)
                                ])
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const EditHabitButton(),
                                MarkAsDoneButton(index: index, state: state)
                              ],
                            ),
                    ),
                  ],
                )
              : Container(),
        );
      },
    );
  }
}

class HabitItem extends StatelessWidget {
  final String title;
  final String? description;
  final IconData icon;
  final IconData? iconDescription;
  final int index;
  const HabitItem({
    super.key,
    required this.title,
    this.description,
    required this.icon,
    this.iconDescription,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: defaultTopPadding / 2,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        child: GestureDetector(
          onTap: () {
            context.read<SelectedDayCubit>().changeHabitExpanded(index);
          },
          child: Container(
            decoration: BoxDecoration(
              color: themeData.colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                HabitItemVisible(
                  title: title,
                  description: description,
                  icon: icon,
                  iconDescription: iconDescription,
                  index: index,
                ),
                HabitItemExpanded(index: index),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Martin Gogołowicz || SobGOG || 01.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 02.09.2023
