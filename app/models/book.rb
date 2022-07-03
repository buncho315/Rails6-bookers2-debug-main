class Book < ApplicationRecord
  belongs_to  :user
  has_one_attached :image
  #has_many :favorites, dependent: :destroy カリキュラムより、一旦

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end  #追記
end
