class Api::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations/user_id
  def index
    user_id = params[:user_id]
    @reservs_with_imgs = Reservation.includes(course: { image_attachment: :blob }).where(user_id:).map do |reservation|
      {
        id: reservation.id,
        user_id: reservation.user_id,
        course_id: reservation.course_id,
        city: reservation.city,
        date: reservation.date,
        course: {
          id: reservation.course.id,
          name: reservation.course.name,
          description: reservation.course.description,
          fee: reservation.course.fee,
          startDate: reservation.course.startDate,
          image_url: reservation.course.image.attached? ? url_for(reservation.course.image) : nil
        }
      }
    end

    render json: @reservs_with_imgs
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
    render json: { message: 'Reservation deleted successfully' }
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Reservation not found' }, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:user_id, :course_id, :city, :date)
  end
end
