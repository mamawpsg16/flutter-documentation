import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as date_pickers;


class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePickerExample(),
        TimePickerExample(),
        DateFormatterExample(),
        DateRangePickerExample()
      ],
    );
  }
}

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  // To hold the selected date
  DateTime? _selectedDate;

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Initial date
      firstDate: DateTime(2000), // Earliest date
      lastDate: DateTime(2101), // Latest date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          _selectedDate == null
              ? 'No date selected!'
              : 'Selected Date: ${_selectedDate!.toLocal()}',
          style: TextStyle(fontSize: 16),
        ),
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: Text('Select Date'),
        ),
      ],
    );
  }
}


class TimePickerExample extends StatefulWidget {
  const TimePickerExample({super.key});

  @override
  _TimePickerExampleState createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  // To hold the selected time
  TimeOfDay? _selectedTime;

  // Function to show the time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // Initial time
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          _selectedTime == null
              ? 'No time selected!'
              : 'Selected Time: ${_selectedTime!.format(context)}',
          style: TextStyle(fontSize: 16),
        ),
        ElevatedButton(
          onPressed: () => _selectTime(context),
          child: Text('Select Time'),
        ),
      ],
    );
  }
}

class DateFormatterExample extends StatelessWidget {
  const DateFormatterExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Current date and time
    DateTime now = DateTime.now();

    // Example of formatting the date to "MM/dd/yyyy"
    String formattedDate = DateFormat('MM/dd/yyyy').format(now);

    // Example of formatting the date to "yyyy-MM-dd"
    String formattedDate2 = DateFormat('yyyy-MM-dd').format(now);

    // Example of formatting the date to a more human-readable format
    String formattedDate3 = DateFormat.yMMMMd().format(now); // "April 6, 2025"

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Formatted Date (MM/dd/yyyy): $formattedDate'),
        Text('Formatted Date (yyyy-MM-dd): $formattedDate2'),
        Text('Formatted Date (Full Date): $formattedDate3'),
      ],
    );
  }
}

class DateRangePickerExample extends StatefulWidget {
  const DateRangePickerExample({super.key});

  @override
  _DateRangePickerExampleState createState() => _DateRangePickerExampleState();
}

class _DateRangePickerExampleState extends State<DateRangePickerExample> {
  // Store the selected date range
  DateTimeRange _selectedDateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 7)),
  );

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),  // The earliest date users can select
      lastDate: DateTime(2026),   // The latest date users can select
      initialDateRange: _selectedDateRange, // Use stored date range
      // You can also customize the appearance
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      setState(() {
        _selectedDateRange = picked; // Update the stored range
      });
      
      // Format dates to SQL format (YYYY-MM-DD)
      String startDateSQL = "${picked.start.year}-${picked.start.month.toString().padLeft(2, '0')}-${picked.start.day.toString().padLeft(2, '0')}";
      String endDateSQL = "${picked.end.year}-${picked.end.month.toString().padLeft(2, '0')}-${picked.end.day.toString().padLeft(2, '0')}";
      
      // Print both raw and SQL formatted dates
      print('Selected date range: ${picked.start} to ${picked.end}');
      print('SQL start_date: $startDateSQL');
      print('SQL end_date: $endDateSQL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Current Range: ${DateFormat('MMM d, y').format(_selectedDateRange.start)} - '
          '${DateFormat('MMM d, y').format(_selectedDateRange.end)}',
          style: TextStyle(fontSize: 16),
        ),
        ElevatedButton(
          onPressed: () => _selectDateRange(context),
          child: Text('Select Date Range'),
        ),
      ],
    );
  }
}