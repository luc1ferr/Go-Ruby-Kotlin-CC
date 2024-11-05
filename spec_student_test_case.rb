require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/reporters'
require_relative 'student_class.rb'

Minitest::Reporters.use! Minitest::Reporters::HtmlReporter.new(
  reports_dir: 'test/reports/spec',
  report_filename: 'student_spec_test_results.html',
  clean: true,
  add_timestamp: true
)

describe Student do
  let(:student) { Student.new("Patron", "Dog", "2000-01-01") }

  after do
    Student.class_variable_set(:@@students, [])
  end

  it "calculates correct age" do
    expect(student.calculate_age).must_equal 24
  end

  it "raises error for duplicate students" do
    student
    expect { student }.must_raise ArgumentError
  end

  it "finds students by age" do
    student
    expect(Student.get_students_by_age(24)).must_include student
  end

  it "finds students by name" do
    student
    expect(Student.get_students_by_name("Dog")).must_include student
  end

  it "raises error for future birth date" do
    expect { Student.new("Patron", "Dog", "3000-01-01") }.must_raise ArgumentError
  end
end
