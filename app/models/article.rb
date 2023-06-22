class Article < ApplicationRecord
  belongs_to :author
  has_many :photos 
  has_many :favorites

  def author_name
    return author.first_name + " " + author.last_name
  end
end
