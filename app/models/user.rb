class User < ActiveRecord::Base
  validates  :username, presence: true, uniqueness: true
  has_secure_password

  has_many :mixes, foreign_key: "creator_id", class_name: "Mix"
end
