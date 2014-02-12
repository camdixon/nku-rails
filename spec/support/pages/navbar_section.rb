class NavbarSection
  include Capybara::DSL

  def signed_in?
    has_css?('.navbar .current-student')
  end

  def sign_out
    click_on "Sign out"
  end
end
