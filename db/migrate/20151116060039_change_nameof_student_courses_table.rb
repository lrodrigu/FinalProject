class ChangeNameofStudentCoursesTable < ActiveRecord::Migration
  def change
  rename_table :student_courses, :investor_interests
  end
end
