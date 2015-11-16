class ProjectsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:search].present?
			@projects = Project.search(params[:search])
		else
			@projects = Project.all
		end
	end

	def show
		@project = Project.find_by_id(params[:id])
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find_by_id(params[:id])
	end


	def create
		@project = Project.new(project_params)

		if @project.save
			flash[:notice] = 'Project saved successfully'
			redirect_to project_path(@project)
			#redirect_to projects_path(@project), notice: 'Project was added successfully'
			#happy path
		else
			flash[:alert] = 'There was an error creating the project'
			render :new
			#unhappy path
		end
	end

	def update
		@project = Project.find_by_id(params[:id])
		# if project is found
		if @project.update_attributes(project_params)
			redirect_to projects_path, notice: 'Project was updated successfully'
			
		# call update attributes in project and pass in field valies
		# show flash message confirming the successful update
		else
			flash[:alert]= 'Bad things happened!'
			render :edit
		# redirect to the index page
		# if project is not found
		end
		# render :edit page with flash message informing user of an error
	end

	def destroy
		@project = Project.find_by_id(params[:id])

		if @project.destroy
			flash[:notice] = "#{@project.name} was successfully deleted"
		else
			flash[:alert] = "There was an error while attempting to delete this project"
		end

			redirect_to projects_path
	end

	private

		def project_params
			params.require(:project).permit(:name, :investor_id)
		end


end