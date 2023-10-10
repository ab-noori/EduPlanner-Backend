class Api::CoursesController < ApplicationController
  before_action :set_course, only: %i[show update destroy]

  # GET /courses
  def index
    @courses_with_images = Course.includes(:image_attachment).map do |course|
      image_url = course.image.attached? ? url_for(course.image) : nil
      {
        id: course.id,
        name: course.name,
        description: course.description,
        fee: course.fee,
        startDate: course.startDate,
        image_url:
      }
    end

    render json: @courses_with_images, location: api_courses_url
  end

  # GET /courses/1
  def show
    @course_with_image = course_with_image
    render json: @course_with_image
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: api_course_url(@course)
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.includes(:image_attachment).find(params[:id])
  end

  def course_with_image
    image_url = @course.image.attached? ? url_for(@course.image) : nil
    {
      id: @course.id,
      name: @course.name,
      description: @course.description,
      fee: @course.fee,
      startDate: @course.startDate,
      image_url:
    }
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :description, :image, :fee, :startDate)
  end
end
