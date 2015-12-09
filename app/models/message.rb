class Message < ActiveRecord::Base
  belongs_to :user
  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
