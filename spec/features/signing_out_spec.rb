require 'spec_helper'

feature 'Signing out' do
  let(:navbar_section) { NavbarSection.new }
  let(:student) { create(:student) }

  before { sign_in(student) }

  context "valid password" do
    scenario do
      navbar_section.sign_out
      expect(navbar_section).to_not be_signed_in
    end
  end
end
