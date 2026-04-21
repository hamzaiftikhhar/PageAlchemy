class Book < ApplicationRecord
  belongs_to :supplier
  belongs_to :author, -> { includes(:author.name) } #is it correct? This is scope function that includes the associated author records when querying for books. It allows you to access the author's name directly from the book object without triggering additional database queries. For example, you can do book.author.name without causing an N+1 query problem.

  has_many :reviews
  has_and_belongs_to_many :orders

  scope :in_print, -> { where(out_of_print: false) } #This is the scope function
  scope :costs_more_than, ->(amount) { where("price > ?", amount) }


   #this is the instance method that returns the highlighted reviews for a book. It checks if the number of reviews for the book is greater than or equal to 2. If it is, it returns all the reviews; otherwise, it returns an empty ActiveRecord relation (Review.none). This method can be used to display highlighted reviews for a book on a webpage or in an application.
  def highlighted_reviews
  if reviews.count >= 2
    reviews
  else
    Review.none #this is the bug 
  end
  end

  #this comment is just of the ging 
end
