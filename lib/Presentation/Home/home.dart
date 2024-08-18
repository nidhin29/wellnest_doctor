// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wellnest_doctor/Presentation/Messages/chat.dart';
import 'package:wellnest_doctor/Presentation/constants/constants.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final CalendarFormat _format = CalendarFormat.month;
  // ignore:
  ValueNotifier _selectedDay = ValueNotifier(DateTime.now());
  ValueNotifier _focussedDay = ValueNotifier(DateTime.now());
  ValueNotifier<int?> _currentIndex = ValueNotifier<int?>(null);
  ValueNotifier<bool> _timeSelected = ValueNotifier(false);
  String? token;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    String getGreeting() {
      final hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning';
      } else if (hour > 12 && hour < 17) {
        return 'Good Afternoon';
      } else {
        return 'Good Evening';
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size * 0.2),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: maincolor,
            titleSpacing: size * 0.09,
            title: Padding(
              padding: EdgeInsets.only(top: size * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${getGreeting()}👋',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ))),
                  Text('Dr. John Doe',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ))),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          kheight10,
          Text('Appointments',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ))),
          ValueListenableBuilder(
            valueListenable: _selectedDay,
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size * 0.02),
                child: TableCalendar(
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                  ),
                  calendarFormat: _format,
                  focusedDay: value,
                  firstDay: DateTime.now(),
                  lastDay: DateTime(DateTime.now().year, 12, 31),
                  rowHeight: 48,
                  calendarStyle: const CalendarStyle(
                    isTodayHighlighted: true,
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: maincolor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                  },
                  selectedDayPredicate: (day) =>
                      isSameDay(day, _selectedDay.value),
                  onDaySelected: (selectedDay, focusedDay) {
                    _selectedDay.value = selectedDay;
                    _focussedDay.value = focusedDay;
                    if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
                      _timeSelected.value = false;
                      _currentIndex.value = null;
                    }
                  },
                ),
              );
            },
          ),
          kheight20,
          Padding(
            padding: EdgeInsets.all(size * 0.07),
            child: SizedBox(
              height: size * 0.4,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChatPage()));
                      },
                      child: AppointmentTileWidget(
                          size: size,
                          name: 'Nidhin V Ninan',
                          date: 'Monday July 13',
                          time: '10:00 AM'),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return kwidth10;
                  },
                  itemCount: 5),
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentTileWidget extends StatelessWidget {
  const AppointmentTileWidget({
    super.key,
    required this.size,
    required this.name,
    required this.date,
    required this.time,
  });

  final double size;
  final String name;

  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.8,
      height: size * 0.4,
      decoration: BoxDecoration(
        color: maincolor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: size * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  width: size * 0.13,
                  height: size * 0.13,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      name[0],
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: maincolor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ))),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: size * 0.7,
              height: size * 0.12,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 209, 205, 205)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.calendar_month),
                  Text(
                    date,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                  const Icon(Icons.access_time),
                  Text(
                    time,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
