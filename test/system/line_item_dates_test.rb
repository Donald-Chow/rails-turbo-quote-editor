require "application_system_test_case"

class LineItemDatesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)

    @quote = quotes(:first)
    @line_item_date = line_item_dates(:today)

    visit quote_path(@quote)
  end

  test "create a line item date" do
    assert_selector "h1", text: "First quote"

    click_on "New date"
    assert_selector "h1", text: "First quote"
    fill_in "Date", with: Date.current + 1.day

    click_on "Create date"
    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test "update a line item date" do
    assert_selector "h1", text: "First quote"

    within id: dom_id(@line_item_date) do
      click_on "Edit"
    end

    assert_selector "h1", text: "First quote"

    fill_in "Date", with: Date.current + 1.day
    click_on "Update date"

    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test "delete a line item date" do
    assert_selector "h1", text: "First quote"

    within id: dom_id(@line_item_date) do
      accept_confirm do
        click_on "Delete"
      end
    end

    assert_no_text I18n.l(@line_item_date.date, format: :long)
  end
end
