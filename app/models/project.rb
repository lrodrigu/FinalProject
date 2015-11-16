class Project < ActiveRecord::Base
belongs_to :investor

	def self.search(search)
		where("name LIKE ?", "%#{search}%")

	end

end
