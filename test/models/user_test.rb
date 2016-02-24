require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "dawn", email: "1142144213@qq.com",
                     password: "tobeno.1", password_confirmation: "tobeno.1")
  end

  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
  
  
  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @user.destroy    
    end
  end

  test "should follow and unfollow a user" do
    dawn  = users(:dawn)
    chen  = users(:chen)
    assert_not dawn.following?(chen)
    dawn.follow(chen)
    assert dawn.following?(chen)
    assert chen.followers.include?(dawn)
    dawn.unfollow(chen)
    assert_not dawn.following?(chen)
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
