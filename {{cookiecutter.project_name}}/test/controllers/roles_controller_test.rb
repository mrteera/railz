require "test_helper"

class RolesControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:one)
  end

  def role
    @role ||= roles :one
  end

  def test_user_cannot_access_role
    sign_out users(:one)
    sign_in users(:two)
    assert_raise(CanCan::AccessDenied) { get roles_url }
  end

  def test_index
    get roles_url
    assert_response :success
  end

  def test_new
    get new_role_url
    assert_response :success
  end

  def test_create
    assert_difference "Role.count" do
      post roles_url, params: { role: { name: role.name } }
    end

    assert_redirected_to role_path(Role.last)
  end

  def test_create_cannot_be_empty
    assert_difference "Role.count", 0 do
      post roles_url, params: { role: { name: nil } }
    end

    assert_response :success
    assert_template 'new'
  end

  def test_show
    get role_url(role)
    assert_response :success
  end

  def test_edit
    get edit_role_url(role)
    assert_response :success
  end

  def test_update
    patch role_url(role), params: { role: { name: role.name } }
    assert_redirected_to role_path(role)
  end

  def test_update_cannot_be_empty
    patch role_url(role), params: { role: { name: nil } }

    assert_response :success
    assert_template 'edit'
    assert_select 'li', "Name can't be blank"
  end

  def test_destroy
    assert_difference "Role.count", -1  do
      delete role_url(role)
    end

    assert_redirected_to roles_path
  end
end
