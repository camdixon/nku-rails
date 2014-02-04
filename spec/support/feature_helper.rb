module FeatureHelper
  def sign_in(user)
    NewSessionPage.new.visit_page.sign_in(user)
  end
end
