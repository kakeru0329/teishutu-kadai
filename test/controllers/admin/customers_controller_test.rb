# frozen_string_literal: true

require "test_helper"

class Admin::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_customers_show_url
    assert_response :success
  end
end
