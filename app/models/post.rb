class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :author, :presence => true
  validates :body, :presence => true
end
