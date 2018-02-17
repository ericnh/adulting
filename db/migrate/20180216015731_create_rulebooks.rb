class CreateRulebooks < ActiveRecord::Migration[5.0]
  def change
    create_table :rulebooks do |t|
      t.integer :major_version
      t.integer :minor_version
      t.text :markdown_text

      t.timestamps
    end
  end
end
