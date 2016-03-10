require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  subject { response }
  let(:article) { create(:article) }

  describe "#new" do
    before { get :new }
    it { is_expected.to be_success }
  end

  describe "#create" do
    context "with valid data" do
      it "creates a new article" do
        expect { 
           post :create, article: { title: "A title", text: "Some text" }
        }.to change(Article, :count).by(1)
      end
    end
    context "with an invalid article" do
      before { post :create, article: { title: "bad", text: "Some text" } }
      it { is_expected.to be_success }
    end
  end

  describe "#show" do
    before { get :show, id: article }
    it { is_expected.to be_success }
  end

  describe "#index" do
    before { get :index }
    it { is_expected.to be_success }    
  end

  describe "#edit" do
    before { get :edit, id: article }
    it { is_expected.to be_success }    
  end

  describe "#update" do
    context "with valid data" do
      before { post :update, id: article, article: { title: "New title", text: "Updated content" } }
      it { is_expected.to be_redirect}
    end
    context "with invalid data" do
      before { post :update, id: article, article: { title: "bad", text: "Updated content" } }
      it { is_expected.to be_success}  
    end
  end

  describe "#destroy" do
    let!(:article) { create(:article) }
    it "deletes an article" do
     expect{ 
        delete :destroy, id: article
     }.to change(Article, :count).by(-1)
    end
  end
end
