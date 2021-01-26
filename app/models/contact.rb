class Contact < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 30}
  validates :title, length: {maximum: 20}
  validates :content, presence: true, length: {maximum: 300}
end
