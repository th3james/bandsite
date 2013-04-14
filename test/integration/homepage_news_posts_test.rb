require 'test_helper'

class HomepageNewsPostsTest < ActionDispatch::IntegrationTest

  test "2 posts exists, you see both of them on the home page" do
    post_1 = FactoryGirl.create(:post, :title => 'first post', :body => 'first body')
    post_2 = FactoryGirl.create(:post, :title => '2nd post', :body => '2nd body')

    visit root_url

    assert page.has_content?('first post')
    assert page.has_content?('first body')

    assert page.has_content?('2nd post')
    assert page.has_content?('2nd body')
  end

  test "2 posts exist, on clicking the title on the homepage, you are taken to the show page" do
    post_1 = FactoryGirl.create(:post, :title => 'first post', :body => 'first body')
    post_2 = FactoryGirl.create(:post, :title => '2nd post', :body => '2nd body')

    visit root_url

    click_link "first post"

    assert_equal post_path(post_1), current_path
    
    assert page.has_content?('first post')
    assert page.has_content?('first body')

    assert !page.has_content?('2nd post')
    assert !page.has_content?('2nd body')
  end

  test "Posts on the index page should be paginated, 5 a page, newest fist" do
    #Setup
    #Create 5 older posts
    5.times do |i|
      FactoryGirl.create(:post, :title => "Older post #{i}")
    end
    sleep(1)
    #Create 5 newer posts
    5.times do |i|
      FactoryGirl.create(:post, :title => "Newer post #{i}")
    end

    visit posts_path

    # First page should only container newer elements
    assert page.has_content?('Newer post')
    assert !page.has_content?('Older post')
  end

  test "Body text is printed unescaped on index, so links etc can be created" do
    #Setup
    post_1 = FactoryGirl.create(:post, :body => "<a href='#{root_url}'>MagicEmbeddedLink</a>")

    #Navigation
    visit posts_path

    click_link "MagicEmbeddedLink"

    assert_equal root_path, current_path
  end

  test "Body text is printed unescaped on show page, so links etc can be created" do
    #Setup
    post_1 = FactoryGirl.create(:post, :body => "<a href='#{root_url}'>MagicEmbeddedLink</a>")

    #Navigation
    visit post_path(post_1)

    click_link "MagicEmbeddedLink"

    assert_equal root_path, current_path
  end
end
