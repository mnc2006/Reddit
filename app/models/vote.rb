class Vote < ActiveRecord::Base

  belongs_to :posts
  belongs_to :user

end
