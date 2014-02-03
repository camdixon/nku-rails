class Avatar
  GRAVATAR_BASE_URL = "http://www.gravatar.com/avatar/"
  GRAVATAR_DEFAULT = "mm"
  SIZE = 200

  def self.from_student(student)
    new(image_url: student.image_url, email: student.email)
  end

  def initialize(attributes)
    @image_url = attributes[:image_url]
    @email = attributes[:email]
  end

  def to_s
    if @image_url.present?
      @image_url
    elsif @email.present?
      gravatar_url
    else
      fallback_url
    end
  end

  private

  def gravatar_url
    gravatar_from_digest Digest::MD5.hexdigest(@email)
  end

  def fallback_url
    gravatar_from_digest(123)
  end

  def gravatar_from_digest(digest)
    "#{GRAVATAR_BASE_URL}#{digest}?s=#{SIZE}&d=#{GRAVATAR_DEFAULT}"
  end
end
