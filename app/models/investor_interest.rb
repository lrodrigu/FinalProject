class InvestorInterest < ActiveRecord::Base
	belongs_to :investor
	belongs_to :interest
end
