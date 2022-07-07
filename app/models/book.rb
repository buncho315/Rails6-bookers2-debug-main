class Book < ApplicationRecord
  belongs_to  :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "完全一致"
      @book = Book.where("title Like?", "#{word}")
    elsif search == "前方一致"
      @book = Book.where("title Like?", "#{word}%")
    elsif search == "後方一致"
      @book = Book.where("title Like?", "%#{word}")
    elsif search == "部分一致"
      @book = Book.where("title Like?", "%#{word}%")
    else
      @book = Book.all
    end
  end

end
