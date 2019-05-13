require "application_system_test_case"
require 'pry-byebug'

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New Game"
    assert_selector "li", count: 10
  end

  test "submitting the form with random word that's not in the grid returns an error" do
    visit new_url
    assert test: "Not in grid"
    fill_in "try", with: "destrtrgsfsfs"
    sleep(3)
    click_on "Play"

    take_screenshot
    assert_text "Sorry but"
    assert_text "can't be built out of"
  end

  test "submitting the form with word that doesn't exist" do
    visit new_url
    assert test: "Doesn't exist"
    fill_in "try", with: "d"
    sleep(3)
    click_on "Play"

    take_screenshot
    assert_text "Sorry but"
    assert_text "does not seem to be a valid English word..."
  end

  test "submitting the form with correct vowel" do
    visit new_url
    assert test: "Correct word"
    fill_in "try", with: "a"
    sleep(3)
    click_on "Play"

    take_screenshot
    assert_text "Congratulations"
  end
end
