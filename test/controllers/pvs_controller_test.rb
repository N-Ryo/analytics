require 'test_helper'

class PvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pv = pvs(:one)
  end

  test "should get index" do
    get pvs_url, as: :json
    assert_response :success
  end

  test "should create pv" do
    assert_difference('Pv.count') do
      post pvs_url, params: { pv: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show pv" do
    get pv_url(@pv), as: :json
    assert_response :success
  end

  test "should update pv" do
    patch pv_url(@pv), params: { pv: {  } }, as: :json
    assert_response 200
  end

  test "should destroy pv" do
    assert_difference('Pv.count', -1) do
      delete pv_url(@pv), as: :json
    end

    assert_response 204
  end
end
