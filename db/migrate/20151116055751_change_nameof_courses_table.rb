class ChangeNameofCoursesTable < ActiveRecord::Migration
  def change
  rename_table :courses, :interest
  end
end
