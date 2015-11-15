class AddIsPaidInFullToStudents < ActiveRecord::Migration
  def change
    add_column :students, :is_paid_in_full, :boolean, default: false
  end
end
