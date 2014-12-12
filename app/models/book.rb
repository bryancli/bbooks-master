class Book < ActiveRecord::Base
	belongs_to :author
	belongs_to :category
	has_many :reviews

  validates :author, :presence => true
  validates :title, :presence => true

end
