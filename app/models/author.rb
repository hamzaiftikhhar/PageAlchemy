class Author < ApplicationRecord
  has_many :books, -> { readonly }
end
