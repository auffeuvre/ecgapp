require "test_helper"

class EcgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ecg = ecgs(:one)
  end

  test "should get index" do
    get ecgs_url
    assert_response :success
  end

  test "should get new" do
    get new_ecg_url
    assert_response :success
  end

  test "should create ecg" do
    assert_difference("Ecg.count") do
      post ecgs_url, params: { ecg: { facts: @ecg.facts, name: @ecg.name } }
    end

    assert_redirected_to ecg_url(Ecg.last)
  end

  test "should show ecg" do
    get ecg_url(@ecg)
    assert_response :success
  end

  test "should get edit" do
    get edit_ecg_url(@ecg)
    assert_response :success
  end

  test "should update ecg" do
    patch ecg_url(@ecg), params: { ecg: { facts: @ecg.facts, name: @ecg.name } }
    assert_redirected_to ecg_url(@ecg)
  end

  test "should destroy ecg" do
    assert_difference("Ecg.count", -1) do
      delete ecg_url(@ecg)
    end

    assert_redirected_to ecgs_url
  end
end
