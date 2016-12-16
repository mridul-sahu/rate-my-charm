class User < ApplicationRecord
  before_save { self.name = name.uppercase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :picture, presence: true

end
