require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup 
    @user = users(:michael)
    @Task = @user.categories.new(title: "Lorem ipsum", user_id: @user.user_id)
  end


  test "should be valid" do
    assert_not @Task.valid?
  end

  test "user id should be present" do
    @Task.user_id = nil
    assert_not @Task.valid?
  end

  test "category should be present" do
    @Task.title = nil
    assert_not @Task.valid?
  end

  test "content should be at most 140 characters" do
    @Task.title = "a" * 141
    assert_not @Task.valid?
  end

  test "order should be most recent last" do
    assert_equal categories(:most_recent), Category.last
  end


end
