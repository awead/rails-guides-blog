require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "#create" do
    context "with a valid title" do
      let(:sample) { create(:article) }
      it "has content" do
        expect(sample.title).to eq("Sample title")
        expect(sample.text).to eq("Sample text of the article")
      end
    end
    context "with an invalid title" do
      let(:sample) { build(:article, title: "bad") }
      subject { sample.save }
      it { is_expected.to be false }
    end
  end  

end
