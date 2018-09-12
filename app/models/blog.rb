class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, presence: true,length: { in: 1..15 }
  # validates :content,length: { in: 1..140 }


  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  def message_time
   created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
