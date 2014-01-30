feature 'Signing up' do
  describe "signing up" do
    let(:new_session_page) { NewSessionPage.new }
    let(:navbar_section) { NavbarSection.new }
    let(:student) { create(:student) }

    scenario do
      new_session_page.visit_page
      new_session_page.signin(student)
      expect(navbar_section).to be_signed_in
    end
  end
end