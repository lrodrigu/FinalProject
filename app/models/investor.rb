class Investor < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	validates :full_name, presence: true

	has_many :projects, dependent: :destroy
	
	has_many :investor_interests
	has_many :interests, through: :investor_interests

end

