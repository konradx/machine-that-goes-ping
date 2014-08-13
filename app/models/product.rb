class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, :format => { :with => /\A(\$)?(\d+)(\.|,)?\d{0,2}?\z/}


  def average_rating
	if self.reviews.size > 0
    	self.reviews.average(:rating).round(2)
    else
        'no ratings'
    end
  end

  
end
