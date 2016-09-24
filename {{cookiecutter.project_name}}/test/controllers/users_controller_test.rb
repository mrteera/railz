require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:one)
  end

  def user
    @user ||= users :one
  end

  def test_index
    get users_url
    assert_response :success
  end

  def test_new
    get new_user_url
    assert_response :success
  end
  #
  # def test_create
  #   assert_difference "User.count" do
  #     post users_url, params: {
  #       user: {
  #         name: user.name,
  #         email: 'reshma2@ait.ac.th',
  #         password: 'asdfasdf',
  #         password_confirmation: 'asdfasdf',
  #         role_id: 1
  #       }
  #     }
  #   end
  #   assert_redirected_to root_path
  # end

  # def test_show
  #   get user_url(user)
  #   assert_response :success
  # end

  def test_edit
    get edit_user_url(user)
    assert_response :success
  end

  def test_update
    patch user_url(user), params: { user: { name: user.name, role_id: user.role_id } }
    assert_redirected_to user_path(user)
  end

  def test_update_cannot_be_empty
    patch user_url(user), params: { user: { name: nil } }

    assert_response :success
    assert_template 'edit'
    assert_select 'li', "Name can't be blank"
  end

  def test_destroy
    assert_difference "User.count", -1  do
      delete user_url(user)
    end

    assert_redirected_to users_path
  end
end
