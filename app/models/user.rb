class User < ApplicationRecord
  before_save :set_up
  mount_uploader :picture, PictureUploader
  validates :name,  presence: true, length: { maximum: 50 }
  validates :picture, presence: true
  validates :gender, presence: true
  validate  :picture_size

  def set_up
    self.rating ||= 1500
    self.name = name.upcase
  end

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end


end
