class AddColumnStudentIdToProjects < ActiveRecord::Migration
	def self.up
	rename_column :projects, :students_id, :student_id
	end

	def self.down
	 # rename back if you need or do something else or do nothing
	end
end