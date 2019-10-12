require "application_system_test_case"

class EndUsersTest < ApplicationSystemTestCase
  setup do
    @end_user = end_users(:one)
  end

  test "visiting the index" do
    visit end_users_url
    assert_selector "h1", text: "End Users"
  end

  test "creating a End user" do
    visit end_users_url
    click_on "New End User"

    fill_in "Address", with: @end_user.address
    fill_in "Email", with: @end_user.email
    fill_in "Family name kana", with: @end_user.family_name_kana
    fill_in "Family name kanji", with: @end_user.family_name_kanji
    fill_in "Given name kana", with: @end_user.given_name_kana
    fill_in "Given name kanji", with: @end_user.given_name_kanji
    check "Is deleted" if @end_user.is_deleted
    fill_in "Password", with: @end_user.password
    fill_in "Phone number", with: @end_user.phone_number
    fill_in "Post code", with: @end_user.post_code
    click_on "Create End user"

    assert_text "End user was successfully created"
    click_on "Back"
  end

  test "updating a End user" do
    visit end_users_url
    click_on "Edit", match: :first

    fill_in "Address", with: @end_user.address
    fill_in "Email", with: @end_user.email
    fill_in "Family name kana", with: @end_user.family_name_kana
    fill_in "Family name kanji", with: @end_user.family_name_kanji
    fill_in "Given name kana", with: @end_user.given_name_kana
    fill_in "Given name kanji", with: @end_user.given_name_kanji
    check "Is deleted" if @end_user.is_deleted
    fill_in "Password", with: @end_user.password
    fill_in "Phone number", with: @end_user.phone_number
    fill_in "Post code", with: @end_user.post_code
    click_on "Update End user"

    assert_text "End user was successfully updated"
    click_on "Back"
  end

  test "destroying a End user" do
    visit end_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "End user was successfully destroyed"
  end
end
