require 'delegate'

class StudentPresenter < SimpleDelegator
  GRAVATAR_BASE_URL = "http://www.gravatar.com/avatar/"
  GRAVATAR_DEFAULT = "mm"
  SIZE = 200

  def image_url
    if __getobj__.image_url.present?
      super
    elsif email.present?
      gravatar_url
    else
      fallback_url
    end
  end


  private

  def gravatar_url
    gravatar_from_digest Digest::MD5.hexdigest(email)
  end

  def fallback_url
    gravatar_from_digest(123)
  end

  def gravatar_from_digest(digest)
    "#{GRAVATAR_BASE_URL}#{digest}?s=#{SIZE}&d=#{GRAVATAR_DEFAULT}"
  end
end

