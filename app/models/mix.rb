class Mix < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  has_many :clips
end
