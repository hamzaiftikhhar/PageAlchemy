class Order < ApplicationRecord

  belongs_to :customer
  has_and_belongs_to_many :books

  enum :status, { being_packaged: 0, shipped: 1, complete: 2, cancelled: 3}

end
