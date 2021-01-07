class Blog < ApplicationRecord
  has_rich_text :body
  acts_as_taggable 
  mount_uploader :image, ImageUploader
  belongs_to :category, dependent: :destroy
  belongs_to :user

  validate :title, :body, :image, :category_id
  validate :image_content_type

  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
    errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
  end
end
