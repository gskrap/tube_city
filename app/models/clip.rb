class Clip < ActiveRecord::Base
  validates  :order, presence: true
  validates  :start_time, presence: true
  validates  :duration, presence: true
  validates  :url, presence: true

  belongs_to :mix
end
