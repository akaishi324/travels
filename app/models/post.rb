class Post < ApplicationRecord
  belongs_to :user
   validates :country, presence: true, length: { maximum: 255 }
   validates :area, presence: true, length: { maximum: 255 }
   validates :comment, presence: true, length: { maximum: 255 }
   validates :place, presence: true, length: { maximum: 255 }
   mount_uploader :photo, ImageUploader
end
