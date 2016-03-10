require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "#create" do
    context "with a valid title" do
      let(:sample) { Article.create(title: "Title", text: "Some text for my article") }
      it "has content" do
        expect(sample.title).to eq("Title")
        expect(sample.text).to eq("Some text for my article")
      end
    end
    context "with an invalid title" do
      let(:sample) { Article.new(title: "bad", text: "Some text for my article") }
      subject { sample.save }
      it { is_expected.to be false }
    end
  end  

end
