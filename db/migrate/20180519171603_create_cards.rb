class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.text :name
      t.text :job_text
      t.text :job_subtext
      t.integer :job_type_id
      t.text :sorting_text
      t.text :sorting_subtext
      t.integer :primary_suit_id
      t.integer :secondary_suit_id
      t.text :effect_name
      t.text :effect_text

      t.timestamps
    end
    add_index :cards, :name, unique: true
    add_index :cards, :job_type_id
    add_index :cards, :primary_suit_id
    add_index :cards, :secondary_suit_id
  end
end
