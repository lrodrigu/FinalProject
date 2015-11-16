class ChangeNameOfColumnsInTables < ActiveRecord::Migration
  def change
	rename_column :investor_interests, :student_id, :investor_id
	rename_column :investor_interests, :course_id, :interest_id
	rename_column :investors, :hero, :profile
	rename_column :projects, :student_id, :investor_id
  end
end
