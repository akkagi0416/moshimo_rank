class Article < ActiveRecord::Base
  has_many :rankings
  self.primary_key = :article_id
end
