require 'spec_helper'

feature 'Signing In' do
  let(:new_session_page) { NewSessionPage.new }
  let(:navbar_section) { NavbarSection.new }
  let(:student) { create(:student) }

  context "valid password" do
    scenario do
      new_session_page.visit_page
      new_session_page.signin(student)
      expect(navbar_section).to be_signed_in
    end
  end

  context "invalid password" do
    scenario do
      student.password = "not-my-password"
      new_session_page.visit_page
      new_session_page.signin(student)
      expect(new_session_page).to_not be_successful
      expect(navbar_section).to_not be_signed_in
    end
  end
end