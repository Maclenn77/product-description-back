require "test_helper"

class DescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @description = descriptions(:one)
  end

  test "should get index" do
    get descriptions_url, as: :json
    assert_response :success
  end

  test "should create description" do
    assert_difference("Description.count") do
      post descriptions_url, params: { description: { keywords: @description.keywords, season: @description.season, segment: @description.segment, usage: @description.usage } }, as: :json
    end

    assert_response :created
  end

  test "should show description" do
    get description_url(@description), as: :json
    assert_response :success
  end

  test "should update description" do
    patch description_url(@description), params: { description: { keywords: @description.keywords, season: @description.season, segment: @description.segment, usage: @description.usage } }, as: :json
    assert_response :success
  end

  test "should destroy description" do
    assert_difference("Description.count", -1) do
      delete description_url(@description), as: :json
    end

    assert_response :no_content
  end
end
