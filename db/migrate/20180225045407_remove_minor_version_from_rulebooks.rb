class RemoveMinorVersionFromRulebooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :rulebooks, :major_version
    remove_column :rulebooks, :minor_version
  end
end
