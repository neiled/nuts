require "test_helper"

class PhotosControllerTest < ActionController::TestCase
  def test_show
    get :show
    assert_response :success
  end

  def test_create
    get :create
    assert_response :success
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_destroy
    get :destroy
    assert_response :success
  end

end
