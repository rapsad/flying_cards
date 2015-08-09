class Card < ActiveRecord::Base
  belongs_to :panel

  validates_presence_of :panel_id
  validates_presence_of :text, :translation
end
