require_relative 'student_class.rb'

begin
  student1 = Student.new('Smith', 'Bob', '2001-09-11')
  student2 = Student.new('Wayne', 'Alice', '1999-07-07')
  student3 = Student.new('Bateman', 'Patrick', '1989-12-12')
  student4 = Student.new('Ligma', 'Sigma', '2009-04-25')
  student5 = Student.new('Jones', 'Emily', '2001-08-19')

  puts "Students created successfully."
rescue ArgumentError => e
  puts "Error: #{e.message}"
end

puts "\nList of all students:"
Student.send(:class_variable_get, :@@students).each do |student|
  puts "#{student.surname} #{student.name}, Date of Birth: #{student.date_of_birth}"
end

puts "\nAge of each student:"
Student.send(:class_variable_get, :@@students).each do |student|
  puts "#{student.surname} #{student.name}: #{student.calculate_age} years old"
end

begin
  duplicate_student = Student.new('Alice', 'Wayne', '1999-07-07')
rescue ArgumentError => e
  puts "\nAttempt to add duplicate: #{e.message}"
end

puts "\nRemoving student Patrick Bateman..."
student3.remove_student
puts "Student Patrick Bateman has been removed."

puts "\nList of students after removing Patrick Bateman:"
Student.send(:class_variable_get, :@@students).each do |student|
  puts "#{student.surname} #{student.name}, Date of Birth: #{student.date_of_birth}"
end

age = 23
puts "\nStudents aged #{age}:"
students_by_age = Student.get_students_by_age(age)
students_by_age.each do |student|
  puts "#{student.surname} #{student.name} - #{student.calculate_age} years old"
end

name = 'Alice'
puts "\nStudents with the name #{name}:"
students_by_name = Student.get_students_by_name(name)
students_by_name.each do |student|
  puts "#{student.surname} #{student.name} - Date of Birth: #{student.date_of_birth}"
end
