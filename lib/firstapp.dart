import 'dart:io';
import 'model/student.dart';

List<Student> studentList = [];

void takeInput() {
  print(
      'Select options:\n 1. Add student \n 2. Display List of city \n 3. Display List of college \n 4. Display List of student \n 5. Find Colleges of city \n 6. Find all Student from College \n 7. Find Student detail from name \n 8. Exit');
  int opt = int.parse(stdin.readLineSync());

  switch (opt) {
    case 1:
      takeEntery();
      break;
    case 2:
      displayListOfCity();
      break;
    case 3:
      displayListOfClg();
      break;
    case 4:
      displayListOfStudent();
      break;
    case 5:
      getClgFromCityName();
      break;
    case 6:
      getStdFromClg();
      break;
    case 7:
      getStdDetail();
      break;
    case 8:
      exit(0);
      break;
    default:
      print('Please try again');
      break;
  }
}

void takeEntery() {
  print("Enter City Name");

  String cityName = stdin.readLineSync();

  print('Enter College Name which belongs to $cityName');
  String clgName = stdin.readLineSync();

  print('Enter Student Name which belongs to $clgName');
  String stdName = stdin.readLineSync();

  Student student = Student(city: cityName, college: clgName, name: stdName);
  studentList.add(student);
}

void displayListOfCity() {
  if (studentList.isNotEmpty) {
    List foo = [];
    studentList.forEach((element) => foo.add(element.city));
    foo.toSet().toList().forEach((element) =>print(element));
  } else {
    print('City List is empty');
  }
}

void displayListOfClg() {
  if (studentList.isNotEmpty) {
    List foo = [];
    studentList.forEach((element) => foo.add(element.college));
    foo.toSet().toList().forEach((element) => print(element));
  } else {
    print('College List is empty');
  }
}

void displayListOfStudent() {
  if (studentList.isNotEmpty) {
    List foo = [];
    studentList.forEach((element) => foo.add(element.name));
    foo.toSet().toList().forEach((element) => print(element));
  } else {
    print('Student List is empty');
  }
}

void getClgFromCityName() {
  if (studentList.isNotEmpty) {
    print("Enter City Name");
    String cityName = stdin.readLineSync();
    print("============");
    studentList
        .where((element) => element.city.toLowerCase() == cityName.toLowerCase())
        .toSet()
        .toList()
        .forEach((element) {
      print(element.college);
    });
    print("============");
  } else {
    print('City List is empty');
  }
}

void getStdFromClg() {
  if (studentList.isNotEmpty) {
    print("Enter College Name");
    String clgName = stdin.readLineSync();
    print("============");
   studentList
        .where((element) => element.college.toLowerCase() == clgName.toLowerCase())
        .toSet()
        .toList()
        .forEach((element) {
      print(element.name);
    });
     print("============");
  } else {
    print('College List is empty');
  }
}

void getStdDetail() {
  if (studentList.isNotEmpty) {
    print("Enter Studnet Name");
    String stdName = stdin.readLineSync();
    print("============");
       studentList
        .where((element) => element.name.toLowerCase() == stdName.toLowerCase())
        .toSet()
        .toList()
        .forEach((element) {
      print("College: ${element.college} City: ${element.city}");
    });
    print("============");
  } else {
    print('Student List is empty');
  }
}
