require 'test_helper'

class StoreDetailFlowTest < Capybara::Rails::TestCase
  include ActiveJob::TestHelper

  def setup
    @one = store_details :one
    @two = store_details :two
  end

  test 'StoreDetail index' do
    visit store_details_path

    assert page.has_content?(@one.building)
    assert page.has_content?(@two.building)
  end

  test 'writing a new StoreDetail' do
    write_new_StoreDetail

    latest_StoreDetail = StoreDetail.last

    assert_current_path StoreDetail_path(latest_StoreDetail)
    assert page.has_content?('Test Title')
    assert page.has_content?('Test Body')
  end

    test 'writing a new StoreDetail1' do
    write_new_StoreDetail

    latest_StoreDetail = StoreDetail.last

    assert_current_path StoreDetail_path(latest_StoreDetail)
    assert page.has_content?('Test Title')
    assert page.has_content?('Test Body')
  end

  test 'writing a new StoreDetail sends admin notice' do
    perform_enqueued_jobs do
      write_new_StoreDetail

      last_StoreDetail = StoreDetail.last
      mail      = ActionMailer::Base.deliveries.last

      assert_equal 'admin@example.com', mail['to'].to_s
      assert_equal 'New StoreDetail added', mail.subject
    end
  end

  private

  def write_new_StoreDetail
    visit store_details_path

    click_on 'Add Your Storel'

    fill_in 'Title', with: 'Test Title'
    fill_in 'Body',  with: 'Test Body'
    click_on 'Create StoreDetail'
  end
end