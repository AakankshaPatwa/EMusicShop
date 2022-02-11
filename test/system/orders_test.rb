require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Address1", with: @order.address1
    fill_in "Address2", with: @order.address2
    fill_in "City", with: @order.city
    fill_in "Contact", with: @order.contact
    fill_in "Email", with: @order.email
    fill_in "Firstname", with: @order.firstname
    fill_in "Lastname", with: @order.lastname
    fill_in "Pincode", with: @order.pincode
    fill_in "State", with: @order.state
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address1", with: @order.address1
    fill_in "Address2", with: @order.address2
    fill_in "City", with: @order.city
    fill_in "Contact", with: @order.contact
    fill_in "Email", with: @order.email
    fill_in "Firstname", with: @order.firstname
    fill_in "Lastname", with: @order.lastname
    fill_in "Pincode", with: @order.pincode
    fill_in "State", with: @order.state
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
