# Flutter Habit Tracker App UI + Backend
### Flutter 3.14.0-0.2.pre Null Safety
Beautiful Habit Tracker App with support for both dark and light modes. Created by Martin Gogołowicz. <br/>You can find Features and dependencies below!

## How the app looks:
<img width="320" alt="habit1" src="https://github.com/MonsieurZbanowanYY/HabitMate/assets/81767518/8f638846-203a-4992-9c22-24c90e746a87">
<img width="320" alt="habit2" src="https://github.com/MonsieurZbanowanYY/HabitMate/assets/81767518/b5892d4b-0cab-4751-9efc-bdccd1d6515b">
<img width="320" alt="habit3" src="https://github.com/MonsieurZbanowanYY/HabitMate/assets/81767518/79dec45d-67b9-481b-9e43-b3af5b0eb5dc">
<img width="320" alt="habit4" src="https://github.com/MonsieurZbanowanYY/HabitMate/assets/81767518/00d4e2fb-6605-471b-80f3-e57996c6009d">

## Features and dependencies:
- Dark and Light Mode friendly
- Responsive design
- Add new habit
- Mark as done
- View in the built-in calendar (with marked days)
- Edit habit
- Delete habit
- Login screen template
- Hive to store data locally
- BloC to manage state
- Multilanguage support (currently English and Polish - easy to add more)
- Flex color scheme (easy to change colors)
- GoRouter for navigation
- Freezed for data models
- GetIt for dependency injection
- Easy to edit
- Null safety

## Please leave a ⭐ if you like it 💙

## How to run:
- Clone this repo
- Run `flutter pub get`
- Run `flutter run`

## Add more languages:
- Add new language code to `supportedLocales` in `main.dart` (for example `Locale('pl', '')`)
- Add new file to `l10n` with name `app_LANGUAGE_CODE.arb` (for example `app_pl.arb`)
- Fill the file with translations (you can copy the content from `app_en.arb` and translate it)
- Run `flutter pub get`

## Find bugs or want to improve something?
Feel free to open an issue or create a pull request.

## Find me on:
- [LinkedIn](https://www.linkedin.com/in/martin-gogolowicz)
- [GitHub](https://github.com/MonsieurZbanowanYY)
