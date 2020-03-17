# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings
  # GET /bookings.json
  def index; end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @final = Booking.find(params[:id])
    @booking_final = RoomBooking.where(booking_id: @final.id)

    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "Invoice No",
          page_size: 'A4',
          template: "bookings/show.html.erb",
          layout: "pdf.html",
          orientation: "Landscape",
          lowquality: true,
          zoom: 1,
          dpi: 75
      end
    end
  end

  # def avail_date
  #   byebug
   
  #   @room = Room.find(params[:room_id])
  #   @avail_room = RoomBooking.where(room_id: @room.id)
  #   render json: { room: @avail_room}
  # end

  # GET /bookings/new
  def new
    @avail = []
    @booking = Booking.new
    @spclroom = Room.where('hotel_id=?', params[:format])
    @avail = @spclroom.available_rooms.map { |room| [room.display_room, room.id] }
  end

  # GET /bookings/1/edit
  def edit; end

  # POST /bookings
  # POST /bookings.json
  def create
    @user = User.new
    @user = current_user.id
    @booking = current_user.bookings.build(booking_params)
    a = []
    @booking.room_bookings.each do |room|
      a.push(room.room_id)
    end
    @room = Room.where(id: a)

    @room.each do |room|
      room.availibility = false
      room.save
    end

    respond_to do |format|
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
