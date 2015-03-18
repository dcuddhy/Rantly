class Rant < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { minimum: 144 }

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("body LIKE ?", "%#{search}%")
  end

end
