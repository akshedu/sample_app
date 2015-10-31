require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

	def setup
		@user = users(:akshansh)
		@micropost = @user.microposts.build(content: "Hello World!")
	end

	test "should be valid" do
		assert @micropost.valid?
	end

	test "user ID should be present" do
		@micropost.user_id = nil
		assert_not @micropost.valid?
	end

	test "content should be present" do
		@micropost.content = "  "
		assert_not @micropost.valid?
	end

	test "content should be at most 140 characters" do
		@micropost.content = "a" * 141
		assert_not @micropost.valid?
	end

	test "order should be most recent first" do
		assert_equal Micropost.first, microposts(:four)
	end
 
end