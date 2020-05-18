class Comment < ApplicationRecord
  belongs_to :post

  validates :username, presence: true
  validates :body, presence: true, length: {minimum: 1}
end
