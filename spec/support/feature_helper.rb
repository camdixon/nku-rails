module FeatureHelper
  def signin(user)
    NewSessionPage.new.visit_page.signin(user)
  end
end