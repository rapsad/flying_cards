class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :text
      t.string :translation

      t.timestamps null: false
    end
  end
end
