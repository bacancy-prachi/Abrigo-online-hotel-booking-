# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  #@room_booking = RoomBooking.new
  @final = Booking.find(params[:id])
  @booking_final = RoomBooking.where(booking_id:  @final.id)
  # @room_booking = RoomBooking.find params[:id].split(',')
  # @room_booking = RoomBooking.find(params[:booking_id])
  # @booking = Booking.find(params[:id])
  # @room_booking = RoomBooking.find(params[:id])

   end

  # GET /bookings/new
  def new
    
    @booking = Booking.new
    @spclroom = Room.where("hotel_id=?",params[:format])
  end

  # GET /bookings/1/edit
  def edit; end

  # POST /bookings
  # POST /bookings.json
  def create
    @user=User.new
    @user=current_user.id
    @booking = current_user.bookings.build(booking_params)
    
 
    # @room_booking = RoomBooking.new(booking_params)
    # @room_booking = params[:booking][:room_bookings_attributes]
    # @booking = Booking.new(booking_params)
    # @booking.user_id = current_user
    
    respond_to do |format|
      @booking.rooms.each do |room| 
        room.availability = false 
      end
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    render :confirm
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:hotel_id, room_bookings_attributes: %i[id room_id check_in check_out _destroy], categories_attributes: %i[id name _destroy])
    # byebug
  end
end
