class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false, presence: true, unique: true
      t.text :description
      t.integer :mod_id, presence: true, null: false

      t.timestamps null: false
    end

    add_index :subs, :mod_id
  end
end
