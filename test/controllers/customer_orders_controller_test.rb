require 'test_helper'

class CustomerOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_order = customer_orders(:one)
  end

  test "should get index" do
    get customer_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_order_url
    assert_response :success
  end

  test "should create customer_order" do
    assert_difference('CustomerOrder.count') do
      post customer_orders_url, params: { customer_order: {  } }
    end

    assert_redirected_to customer_order_url(CustomerOrder.last)
  end

  test "should show customer_order" do
    get customer_order_url(@customer_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_order_url(@customer_order)
    assert_response :success
  end

  test "should update customer_order" do
    patch customer_order_url(@customer_order), params: { customer_order: {  } }
    assert_redirected_to customer_order_url(@customer_order)
  end

  test "should destroy customer_order" do
    assert_difference('CustomerOrder.count', -1) do
      delete customer_order_url(@customer_order)
    end

    assert_redirected_to customer_orders_url
  end
end
