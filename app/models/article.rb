class Article < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	belongs_to :user
	has_many :article_categories
	has_many :categories, through: :article_categories
	validates :title,  presence: true, length: { minimum: 10}
	validates :excerpt,  presence: true, length: { minimum: 5, maximum: 30}
	validates :description, presence: true, length: { minimum: 10}
	validates :user_id, presence: true

	def article_title
   		 return "#{title} #{description}".strip if (title || description)
    "No Articles"
  	end
  	
  	def self.search(search)
  		if search
  			where(["title LIKE ?", "%#{search}%"])
  			where(["description LIKE ?", "%#{search}%"])
  		else
  			all
  		end
  	end
end