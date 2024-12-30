
abstract class Role {
  void displayRole();
}

class Person {
  String name;
  int age;
  String address;


  Person({this.name="", this.age=0, this.address=""});


  String get getName => name;
  int get getAge => age;
  String get getAddress => address;


  void displayRole() {
    print("Role: Undefined");
  }
}


class Student extends Person {
  String studentID;
  List<double> courseScores;

  /
  Student({
    String name="",
    int age=0,
    String address="",
    this.studentID="",
    required this.courseScores,
  }) : super(name: name, age: age, address: address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  
  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }
    double totalScore = courseScores.reduce((sum, score) => sum + score);
    return double.parse((totalScore / courseScores.length).toStringAsFixed(1)); // Round to 1 decimal
  }
}


class Teacher extends Person {
  final String teacherID;
  final List<String> coursesTaught;

  
  Teacher({
    String name ="",
    int age=0,
    String address="",
    this.teacherID="",
    required this.coursesTaught,
  }) : super(name: name, age: age, address: address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }


  String getFormattedCourses() {
    return coursesTaught.join(", ");
  }
}


class StudentManagementSystem {
  void manage() {

    Student student = Student(
      name: "John Doe",
      age: 20,
      address: "123 Main Street",
      studentID: "S101",
      courseScores: [90, 85, 82],
    );


    Teacher teacher = Teacher(
      name: "Mrs. Smith",
      age: 35,
      address: "456 Oak St",
      teacherID: "T201",
      coursesTaught: ["Math", "English", "Bangla"],
    );


    print("Student Information:");
    student.displayRole(); 
    print("Name: ${student.getName}");
    print("Age: ${student.getAge}");
    print("Address: ${student.getAddress}");
    print("Average Score: ${student.calculateAverageScore()}");
    print("");


    print("Teacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.getName}");
    print("Age: ${teacher.getAge}");
    print("Address: ${teacher.getAddress}");
    print("Courses Taught: ${teacher.getFormattedCourses()}");
  }
}

void main() {
  StudentManagementSystem system = StudentManagementSystem();
  system.manage();
}
