require 'rails_helper'

RSpec.describe ArticlePresenter do

  let(:article) { create(:article) }
  let(:presenter) { described_class.new(article) }

  describe "delegated methods" do
    it "use methods from the model" do
      expect(presenter.title).to eq(article.title)
      expect(presenter.text).to eq(article.text)
    end
  end

  describe "#formatted_comments" do
  	let(:article) { create(:article_with_anonymous_comment) }
    it "displays comments as one string" do
      expect(presenter.formatted_comments).to contain_exactly("Sample content of the anonymous comment (anonymous)")
    end
  end

  describe "#has_comments?" do
  	subject { presenter }
    context "with comments" do
      before { allow(presenter).to receive(:comments).and_return(["A comment!"]) }
      it { is_expected.to have_comments }
    end
    context "without comments" do
      it { is_expected.not_to have_comments }
    end
  end

end
