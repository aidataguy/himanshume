class Design <  ActiveRecord::Base
extend FriendlyId
friendly_id :name, use: :slugged
belongs_to :users
validates :name, :design_description, presence: true
	

end
