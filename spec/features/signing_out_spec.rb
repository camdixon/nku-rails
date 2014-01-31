require 'spec_helper'

feature 'Signing out' do
  let(:navbar_section) { NavbarSection.new }
  let(:student) { create(:student) }

  before { signin(student) }

  context "valid password" do
    scenario do
      navbar_section.signout
      expect(navbar_section).to_not be_signed_in
    end
  end
end