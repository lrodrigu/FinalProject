class ChangeNameOfInterestTable < ActiveRecord::Migration
  def change
    rename_table :interest, :interests
  end
end
