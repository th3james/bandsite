require 'test_helper'

class HomepageNewsPostsTest < ActionDispatch::IntegrationTest

  test "2 posts exists, you see both of them on the home page" do
    post_1 = Factory.create(:post, :title => 'first post', :body => 'first body')
    post_2 = Factory.create(:post, :title => '2nd post', :body => '2nd body')

    visit root_url

    assert page.has_content?('first post')
    assert page.has_content?('first body')

    assert page.has_content?('2nd post')
    assert page.has_content?('2nd body')
  end

  test "2 posts exist, on clicking the title on the homepage, you are taken to the show page" do
    post_1 = Factory.create(:post, :title => 'first post', :body => 'first body')
    post_2 = Factory.create(:post, :title => '2nd post', :body => '2nd body')

    visit root_url

    click_link "first post"

    assert_equal post_path(post_1), current_path
    
    assert page.has_content?('first post')
    assert page.has_content?('first body')

    assert !page.has_content?('2nd post')
    assert !page.has_content?('2nd body')
  end
end
