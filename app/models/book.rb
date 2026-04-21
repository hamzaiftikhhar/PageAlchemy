class Book < ApplicationRecord
  belongs_to :supplier
  belongs_to :author

  has_many :reviews
  has_and_belongs_to_many :orders

  scope :in_print, -> { where(out_of_print: false) } #This is the scope function
  scope :costs_more_than, ->(amount) { where("price > ?", amount) }


  
  def highlighted_reviews
  if reviews.count >= 2
    reviews
  else
    Review.none
  end
  end
end