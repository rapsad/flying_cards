class AddPanelToCards < ActiveRecord::Migration
  def change
    add_reference :cards, :panel, index: true, foreign_key: true
  end
end
