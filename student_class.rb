require 'date'

class Student
  attr_accessor :surname, :name, :date_of_birth

  @@students = []

  def initialize(surname, name, date_of_birth)
    @surname = surname
    @name = name

    @date_of_birth = validate_date_of_birth(date_of_birth)

    add_student(self)
  end

  def self.unique?(student)
    !@@students.any? { |s| s.surname == student.surname && s.name == student.name && s.date_of_birth == student.date_of_birth }
  end

  def add_student(student)
    if self.class.unique?(student)
      @@students << student
    else
      raise ArgumentError, 'The student already exists in the list'
    end
  end

  def remove_student
    @@students.delete(self)
  end

  def calculate_age
    today = Date.today
    age = today.year - @date_of_birth.year
    age -= 1 if today.yday < @date_of_birth.yday
    age
  end  

  def self.get_students_by_age(age)
    @@students.select { |student| student.calculate_age == age }
  end

  def self.get_students_by_name(name)
    @@students.select { |student| student.name == name }
  end

  private

  def validate_date_of_birth(date_of_birth)
    date = Date.parse(date_of_birth)
    raise ArgumentError, 'Date of birth must be in the past' if date > Date.today
    date
  end

  def self.students
    @@students
  end
end
