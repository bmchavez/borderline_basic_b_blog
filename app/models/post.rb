class Post < ApplicationRecord
  after_create :send_new_post_email
  after_update :send_new_post_email

  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 1}

  private
  
  def send_new_post_email
    # NewPostMailer.with(@users).new_post.deliver_now
    unless self.draft
      NewPostMailer.with(self: user).new_post.deliver_now
    end
  end

end
