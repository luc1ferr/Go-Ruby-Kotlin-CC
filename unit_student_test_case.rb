require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'student_class.rb'

Minitest::Reporters.use! Minitest::Reporters::HtmlReporter.new(
  reports_dir: 'test/reports/unit',
  report_filename: 'student_unit_test_results.html',
  clean: true,
  add_timestamp: true
)

class StudentTest < Minitest::Test
  def setup
    @student = Student.new("Petrushkyn", "Arhyp", "2000-01-01")
  end

  def teardown
    @student.remove_student
  end
  
  def test_calculate_age
    assert_equal 24, @student.calculate_age
  end

  def test_student_uniqueness
    duplicate_student = Student.new("Petrushkyn", "Arhyp", "2000-01-01")
    assert_raises(ArgumentError) { duplicate_student }
  end

  def test_get_students_by_age
    assert_includes(Student.get_students_by_age(24), @student)
  end

  def test_get_students_by_name
    assert_includes(Student.get_students_by_name("Arhyp"), @student)
  end

  def test_invalid_date_of_birth
    assert_raises(ArgumentError) { Student.new("Petrushkyn", "Arhyp", "3000-01-01") }
  end
end
