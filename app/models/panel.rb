class Panel < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, scope: [:user_id]
  has_many :cards
end
