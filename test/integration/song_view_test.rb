require 'test_helper'

class SongViewTest < ActionDispatch::IntegrationTest

  test "2 songs exists, you see both of them on the home page" do
    #Setup
    song_1 = FactoryGirl.create(:song, :name => 'first song', :embed => 'first embed')
    song_2 = FactoryGirl.create(:song, :name => '2nd song', :embed => '2nd embed')

    #Page interaction
    visit root_url
    click_link "Listen"

    #Asserts
    assert_equal songs_path(), current_path

    assert page.has_content?('first song')
    assert page.has_content?('first embed')

    assert page.has_content?('2nd song')
    assert page.has_content?('2nd embed')
  end

  test "2 songs exist, on clicking the name on the homepage, you are taken to the show page" do
    #Model setup
    song_1 = FactoryGirl.create(:song, :name => 'first song', :embed => 'first embed')
    song_2 = FactoryGirl.create(:song, :name => '2nd song', :embed => '2nd embed')

    #Page navigation
    visit root_url
    click_link "Listen"

    click_link "first song"

    #Assertions
    assert_equal song_path(song_1), current_path
    
    assert page.has_content?('first song')
    assert page.has_content?('first embed')

    assert !page.has_content?('2nd song')
    assert !page.has_content?('2nd embed')
  end

  test "Embed content is printed unescaped on index, so links etc can be created" do
    #Setup
    song = FactoryGirl.create(:song, :embed => "<a href='#{root_url}'>MagicSongEmbedLink</a>")

    #Navigation
    visit songs_path

    click_link "MagicSongEmbedLink"

    assert_equal root_path, current_path
  end

  test "Embed content is printed unescaped on show page, so links etc can be created" do
    #Setup
    song = FactoryGirl.create(:song, :embed => "<a href='#{root_url}'>MagicSongEmbedLink</a>")

    #Navigation
    visit song_path(song)

    click_link "MagicSongEmbedLink"

    assert_equal root_path, current_path
  end
end
