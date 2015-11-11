class Post < ActiveRecord::Base

  has_many :votes

  validates_presence_of :title, :url
  end

end
