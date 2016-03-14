require 'rails_helper'

RSpec.describe "articles/show.html.erb", type: :view do
  before do
    assign(:article, presenter)
  	render
  end
  
  context "without comments" do
  	let(:presenter) { ArticlePresenter.new(create(:article)) }
    it "displays one article" do
      expect(rendered).to have_selector("h1", text: "Showing article")
      expect(rendered).to have_link("Edit")
      expect(rendered).to have_link("Back")
      expect(rendered).not_to have_selector("h2", text: "Comments")
    end
  end

  context "with comments" do
  	let(:presenter) { ArticlePresenter.new(create(:article_with_anonymous_comment)) }
    it "displays the article and its comments" do

    end
  end
end
