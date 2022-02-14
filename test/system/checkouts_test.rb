require "application_system_test_case"

class CheckoutsTest < ApplicationSystemTestCase
  setup do
    @checkout = checkouts(:one)
  end

  test "visiting the index" do
    visit checkouts_url
    assert_selector "h1", text: "Checkouts"
  end

  test "creating a Checkout" do
    visit checkouts_url
    click_on "New Checkout"

    fill_in "Address1", with: @checkout.address1
    fill_in "Address2", with: @checkout.address2
    fill_in "City", with: @checkout.city
    fill_in "Contact", with: @checkout.contact
    fill_in "Email", with: @checkout.email
    fill_in "Firstname", with: @checkout.firstname
    fill_in "Lastname", with: @checkout.lastname
    fill_in "Pincode", with: @checkout.pincode
    fill_in "State", with: @checkout.state
    click_on "Create Checkout"

    assert_text "Checkout was successfully created"
    click_on "Back"
  end

  test "updating a Checkout" do
    visit checkouts_url
    click_on "Edit", match: :first

    fill_in "Address1", with: @checkout.address1
    fill_in "Address2", with: @checkout.address2
    fill_in "City", with: @checkout.city
    fill_in "Contact", with: @checkout.contact
    fill_in "Email", with: @checkout.email
    fill_in "Firstname", with: @checkout.firstname
    fill_in "Lastname", with: @checkout.lastname
    fill_in "Pincode", with: @checkout.pincode
    fill_in "State", with: @checkout.state
    click_on "Update Checkout"

    assert_text "Checkout was successfully updated"
    click_on "Back"
  end

  test "destroying a Checkout" do
    visit checkouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checkout was successfully destroyed"
  end
end
