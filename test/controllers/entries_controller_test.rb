require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    # Basic authentication
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials '', ''
    request.env['HTTP_AUTHORIZATION'] = credentials
    @entry = entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should like entry" do
    patch :toggle_like, id: @entry, :format => 'js'
    assert @entry.like, "#{@entry.like}"
    assert_response :success
    patch :toggle_like, id: @entry, :format => 'js'
    assert @entry.like, "#{@entry.like}"
    assert_response :success
  end

end
