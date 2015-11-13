class StudentsController < ApplicationController
	
	def index
		@students = Student.all
	end

	def show
		@student = Student.find_by_id(params[:id])
	end

	def new
		@student = Student.new
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
