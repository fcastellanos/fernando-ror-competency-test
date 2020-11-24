require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is valid (all attribues)" do
    user = users(:user)

    assert user.valid?
  end

  test "user is invalid with no first_name " do
    user = users(:user)

    user.first_name = nil

    refute user.valid?
  end

  test "user is invalid with no last_name " do
    user = users(:user)

    user.last_name = nil

    refute user.valid?
  end
  
  test "user is invalid with no email " do
    user = users(:user)

    user.email = nil

    refute user.valid?
  end

  test 'has_many reviews' do
    assert_has_many User, :articles
  end
end
