require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:article) { Article.create(title: "An article") }

  describe "#create" do
    it "adds a new comment to an article" do
      expect { 
      	post :create, article_id: article, comment: { commenter: "me", body: "the comment"}
      }.to change(Comment, :count).by(1)
    end
  end

  describe "#destroy" do
    let!(:comment) { Comment.create(commenter: "me", body: "the comment", article: article) }
    it "removes the comment from the article" do
      expect {
      	delete :destroy, article_id: article, id: comment
      }.to change(Comment, :count).by(-1)
    end
  end

end
