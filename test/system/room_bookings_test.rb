require "application_system_test_case"

class RoomBookingsTest < ApplicationSystemTestCase
  setup do
    @room_booking = room_bookings(:one)
  end

  test "visiting the index" do
    visit room_bookings_url
    assert_selector "h1", text: "Room Bookings"
  end

  test "creating a Room booking" do
    visit room_bookings_url
    click_on "New Room Booking"

    fill_in "Booking", with: @room_booking.booking_id
    fill_in "Check in", with: @room_booking.check_in
    fill_in "Check out", with: @room_booking.check_out
    fill_in "Room", with: @room_booking.room_id
    click_on "Create Room booking"

    assert_text "Room booking was successfully created"
    click_on "Back"
  end

  test "updating a Room booking" do
    visit room_bookings_url
    click_on "Edit", match: :first

    fill_in "Booking", with: @room_booking.booking_id
    fill_in "Check in", with: @room_booking.check_in
    fill_in "Check out", with: @room_booking.check_out
    fill_in "Room", with: @room_booking.room_id
    click_on "Update Room booking"

    assert_text "Room booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Room booking" do
    visit room_bookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Room booking was successfully destroyed"
  end
end
