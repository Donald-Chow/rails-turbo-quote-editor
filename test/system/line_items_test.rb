require 'application_system_test_case'

class LineItemsTest < ApplicationSystemTestCase
  include ActionView::Helpers::NumberHelper

  setup do
    login_as users(:accountant)

    @quote          = quotes(:first)
    @line_item_date = line_item_dates(:today)
    @line_item      = line_items(:room_today)

    visit quote_path(@quote)
  end

  test 'create a line item' do
    assert_selector 'h1', text: 'First quote'

    within "##{dom_id(@line_item_date)}" do
      click_on 'Add item', match: :first
    end
    assert_selector 'h1', text: 'First quote'

    fill_in 'Name', with: 'Animation'
    fill_in 'Quantity', with: 1
    fill_in 'Unit price', with: 1123
    click_on 'Create item'

    assert_selector 'h1', text: 'First quote'
    assert_text 'Animation'
    assert_text number_to_currency(1123)

    assert_text number_to_currency(@quote.total_price)
  end

  test 'update a line item' do
    assert_selector 'h1', text: 'First quote'

    within "##{dom_id(@line_item)}" do
      click_on 'Edit'
    end
    assert_selector 'h1', text: 'First quote'

    fill_in 'Name', with: 'Capybara article'
    fill_in 'Unit price', with: 1234
    click_on 'Update item'

    assert_selector 'h1', text: 'First quote'
    assert_text 'Capybara article'
    assert_text number_to_currency(1234)

    assert_text number_to_currency(@quote.total_price)
  end

  test 'Destroying a line item' do
    assert_selector 'h1', text: 'First quote'
    within "##{dom_id(@line_item_date)}" do
      p assert_text @line_item.name
    end

    within "##{dom_id(@line_item)}" do
      click_on 'Delete'
    end

    assert_selector 'h1', text: 'First quote'
    within "##{dom_id(@line_item_date)}" do
      p assert_no_text @line_item.name
    end

    assert_text number_to_currency(@quote.total_price)
  end
end
