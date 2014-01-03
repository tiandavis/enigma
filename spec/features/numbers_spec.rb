require 'spec_helper'

feature "Enter an integer or hex value" do
  scenario "encode number" do
    visit "/"
    
    fill_in "number_value", with: "int: 8191"
    click_button "process_number"
    
    within "#number_results" do
      expect(page).to have_content "7F7F"
    end
  end
  
  scenario "decode number" do
    visit "/"
    
    fill_in "number_value", with: "hex: 5000"
    click_button "process_number"
    
    within "#number_results" do
      expect(page).to have_content "2048"
    end
  end
end