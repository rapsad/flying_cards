class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string :name
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
