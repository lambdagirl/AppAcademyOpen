function Student(fname, lname) {
  this.fname = fname;
  this.lname = lname;
  this.courses = [];
}

Student.prototype.name = function() {
  return this.fname + ' ' + this.lname
};

Student.prototype.enroll = function(course) {
  if (this.courses.indexOf(course) === -1) {
    this.courses.forEach(cs => {
      if (cs.conflictWith(course)) {
        throw 'Course conflict'
      };
    };
    this.courses.push(course);
    course.addStudent(this)
  }
};

Student.prototype.courseLoad = function() {
  const courseLoad = {};
  this.courses.forEach(course => {
    let dpt = course.department;
    courseLoad[dpt] = 0;
    courseLoad[dpt] += course.credits;
  })
  return courseLoad
};

function Course(name, department, credits, days, block) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = [];
  this.block = block;
  this.days = days;
};

Course.prototype.addStudent = function(student) {
  if (!this.students.indexOf(student.name) === -1) {
    this.students.push(student);
    student.enroll(this);
  }
};

Course.prototype.conflictWith = function(course) {
  if (this.block !== course.block) {
    return false;
  }
  return this.days.some(day => course.days.indexOf(day) !== -1);
}
