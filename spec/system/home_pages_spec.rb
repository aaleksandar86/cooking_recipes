require 'rails_helper'

RSpec.describe 'HomePages' do
  before do
    # driven_by :selenium, using: :chrome
    driven_by :rack_test

    visit root_path
  end

  it 'shows the home link' do
    expecting = page.has_link?('Home')

    expect(expecting).to be true
  end

  it 'shows index title' do
    visit root_path
    text = page.has_text?('WELCOME TO OUR COOKING RECIPES WEBSITE')
    expect(text).to be true
  end

  it 'shows page footer' do
    visit root_path
    text = page.has_text?('Cooking recipes exercise')
    expect(text).to be true
  end

  context 'when no user is sign in' do
    it 'shows the Sign In link' do
      expecting = page.has_link?('Sign In')

      expect(expecting).to be true
    end

    it 'shows the Sign Up link' do
      expecting = page.has_link?('Sign Up')

      expect(expecting).to be true
    end
  end

  context 'when user is signed in into the app' do
    before do
      system_log_in(create(:user))
      visit root_path
    end

    it 'shows the New Recipe link' do
      expecting = page.has_link?('New Recipe')

      expect(expecting).to be true
    end

    it 'shows the Log Out link' do
      expecting = page.has_link?('Log Out')

      expect(expecting).to be true
    end
  end

  context 'when a recipe is present' do
    let!(:recipe) { create(:recipe, title: 'Testing with RSpec', description: 'Testing recipe description') }

    before do
      visit root_path
    end

    it 'shows the recipe title' do
      expecting = page.has_content?(recipe.title)

      expect(expecting).to be true
    end

    it 'shows the recipe description' do
      expecting = page.has_content?(recipe.description)

      expect(expecting).to be true
    end

    it 'shows the recipe username' do
      expecting = page.has_content?(recipe.user.username)

      expect(expecting).to be true
    end

    it 'shows the link to full recipe' do
      expecting = page.has_link?('View Recipe')

      expect(expecting).to be true
    end
  end
end
