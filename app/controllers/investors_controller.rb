class InvestorsController < ApplicationController
	before_action :authenticate_user!

	def index
		@investors = Investor.all
	end

	def show
		@investor = Investor.find_by_id(params[:id])
		@projects = @investor.projects
	end

	def new
		@investor = Investor.new
	end

	def edit
		@investor = Investor.find_by_id(params[:id])
	end


	def create
		@investor = Investor.new(investor_params)

		if @investor.save
			redirect_to investor_path(@investor), notice: 'Investor was added successfully'
			
			#redirect_to investors_path(@investor), notice: 'Investor was added successfully'
			#happy path
		else
			flash[:alert] = 'There was an error creating the investor'
			render :new
			#unhappy path
		end
	end

	def update
		@investor = Investor.find_by_id(params[:id])
		# if investor is found
		if @investor.update_attributes(investor_params)
			redirect_to investors_path, notice: 'Investor was updated successfully'
			
		# call update attributes in investor and pass in field valies
		# show flash message confirming the successful update
		else
			flash[:alert]= 'Bad things happened!'
			render :edit
		# redirect to the index page
		# if investor is not found
		end
		# render :edit page with flash message informing user of an error
	end

	def destroy
		@investor = Investor.find_by_id(params[:id])

		if @investor.destroy
			flash[:notice] = "#{@investor.email} was successfully deleted"
		else
			flash[:alert] = "There was an error while attempting to delete this investor"
		end

			redirect_to investors_path
	end

private


def investor_params
	params.require(:investor).permit(:email, :full_name, :phone, :profile, :interest_ids => [])
end


end
