require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:article) { create(:article) }

  describe "#create" do
    it "adds a new comment to an article" do
      expect { 
      	post :create, article_id: article, comment: { commenter: "me", body: "the comment"}
      }.to change(Comment, :count).by(1)
    end
  end

  describe "#destroy" do
    let!(:article) { create(:article_with_comment) }
    let(:comment) { article.comments.first }
    it "removes the comment from the article" do
      expect {
      	delete :destroy, article_id: article, id: comment
      }.to change(Comment, :count).by(-1)
    end
  end

end
