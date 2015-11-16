class Interest < ActiveRecord::Base
	validates :name, presence: true, uniqueness:true

	has_many :investor_interests
	has_many :investors, through: :investor_interests
end
