import 'dart:io';

abstract class Role{
  displayRole();
}

class Person{
  String name;
  int age;
  String address;

  Person({
    this.name="",
    this.age=0,
    this.address=""
  });

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  void displayRole(){

  }
}

class Student extends Person{
  String studentID;
  int grade;
  List<double> courseScores;

  Student({
    String name="",
    int age=0,
    String address ="",
    this.studentID ="",
    this.grade =0,
    required this.courseScores

  }):super(name: name, age: age,address: address);

  @override
  void displayRole(){
    print("Role:Student");
  }

  double calAvgScore(){

    int len = courseScores.length; //Length
    double sum = 0;
    for(int i=0; i<len; i++){
      sum = sum+ courseScores[i];
    }
    double avg = sum/len;
    return avg;

  }
}

class Teacher extends Person{
  String teacherID;
  List<String> coursesTaught;

  Teacher({

    String name="",
    int age=0,
    String adress="",
    this.teacherID="",
    required this.coursesTaught

  }):super(name: name,age: age,address: adress);

  @override
  void displayRole(){
    print("Role:Teacher");
  }

  String getFormattedCourses(){
    return coursesTaught.join("\n-");
  }
}

class StudentManagementSystem{
  manage(String role){
    Student student = Student(

      name: "John Doe",
      age: 20,
      address: "123 Main Street",
      studentID: "S120",
      courseScores: [90,85,82],

    );

    Teacher teacher = Teacher(
      name: "Mrs. Smith",
      age: 35,
      adress: "456 Oak St",
      teacherID: "T120",
      coursesTaught: ["Math","English","Bangla"],
    );

    if(role=="Student") {
      print("Student Information");
      student.displayRole();
      print("Name: ${student.name}");
      print("Age: ${student.age}");
      print("Address: ${student.address}");
      print("Average Score: ${student.calAvgScore()}");
    }

    else if(role=="Teacher") {
      print("Teacher Information");
      teacher.displayRole();
      print("Name: ${teacher.name}");
      print("Age: ${teacher.age}");
      print("Address: ${teacher.address}");
      print("Courses Taught:\n-${teacher.getFormattedCourses()}");
    }
    else {
      print("Enter Correct Role");
    }

  }


}

main(){
  print("The Student Managment System\n---------------");
  StudentManagementSystem smsys = StudentManagementSystem();

  print("Enter Role: Student/Teacher");
  String ? role = stdin.readLineSync();
  smsys.manage(role!);
}