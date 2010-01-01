require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  context "on GET to :index with many posts" do
    setup do
      Factory(:post)
      sleep(1)
      Factory(:post)
      get :index
    end
    
    should_assign_to :posts
    
    should "have posts ordered by date decending" do
      assert assigns(:posts).first.created_at > assigns(:posts).last.created_at 
    end

    should "have only the 5 most recent posts" do
      assert 5 => assigns(:posts).size
    end
  end

end
