class StudentsController < ApplicationController
	
	def index
		@students = Student.all
	end

	def show
		@student = Student.find_by_id(params[:id])
		@projects = @student.projects
	end

	def new
		@student = Student.new
	end

	def edit
		@student = Student.find_by_id(params[:id])
	end


	def create
		@student = Student.new(params[:student])

		if @student.save
			redirect_to student_path(@student), notice: 'Student was added successfully'
			
			#redirect_to students_path(@student), notice: 'Student was added successfully'
			#happy path
		else
			flash[:alert] = 'There was an error creating the student'
			render :new
			#unhappy path
		end
	end

	def update
		@student = Student.find_by_id(params[:id])
		# if student is found
		if @student.update_attributes(params[:student])
			redirect_to students_path, notice: 'Student was updated successfully'
			
		# call update attributes in student and pass in field valies
		# show flash message confirming the successful update
		else
			flash[:alert]= 'Bad things happened!'
			render :edit
		# redirect to the index page
		# if student is not found
		end
		# render :edit page with flash message informing user of an error
	end

	def destroy
		@student = Student.find_by_id(params[:id])

		if @student.destroy
			flash[:notice] = "#{@student.email} was successfully deleted"
		else
			flash[:alert] = "There was an error while attempting to delete this student"
		end

			redirect_to students_path
	end
end
