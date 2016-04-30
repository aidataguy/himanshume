class Category < ActiveRecord::Base
	has_many :article_categories
	has_many :article, through: :article_categories
	validates :name, presence: true,  length: {minimum: 5, maximum: 15}
	validates_uniqueness_of :name
end