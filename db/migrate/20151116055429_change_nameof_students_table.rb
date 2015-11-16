class ChangeNameofStudentsTable < ActiveRecord::Migration
  def change
  rename_table :students, :investors
  end
end
