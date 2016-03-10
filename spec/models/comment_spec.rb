require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:article) { Article.create(title: "Sample title") }

  describe "#create" do
    let(:comment) { Comment.create(commenter: "me", body: "a comment", article: article) }
    it "adds a new comment to an article" do
      expect(comment.commenter).to eq("me")
      expect(comment.body).to eq("a comment")
      expect(comment.article).to eq(article)
    end
    it "associates the article with the comment" do
      expect(article.comments).to contain_exactly(comment)
    end
  end

end
