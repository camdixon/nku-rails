require 'spec_helper'

describe Avatar do
  describe "#from_student" do
    let(:avatar) { Avatar.from_student(student) }

    context "with a image_url from the student" do
      let(:student) { double('student', image_url: 'http://example.com/image.png', email: nil) }

      specify do
        expect(avatar.to_s).to eq('http://example.com/image.png')
      end
    end

    context "with an email and no image_url from the student" do
      let(:student) { double('student', image_url: nil, email: 'mitch.lloyd@gmail.com') }

      specify do
        expect(avatar.to_s).to eq("http://www.gravatar.com/avatar/f1a42e15a7d426b8e717687794e0234b?s=200&d=mm")
      end
    end

    context "with no email or image_url from the student" do
      let(:student) { double('student', image_url: nil, email: nil) }

      specify do
        expect(avatar.to_s).to eq("http://www.gravatar.com/avatar/123?s=200&d=mm")
      end
    end
  end
end
