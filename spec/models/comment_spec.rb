require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:article) { create(:article_with_comment) }

  describe "#create" do
    subject { article.comments.first }
    it "adds a new comment to an article" do
      expect(subject.commenter).to eq("Joe Schmoe")
      expect(subject.body).to eq("Sample content of the comment")
      expect(subject.article).to eq(article)
    end
  end

end
