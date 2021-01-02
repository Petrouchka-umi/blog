class Contact < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true
  validates :content, presence: true, length: {maximum: 300}
end
