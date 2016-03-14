require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do

  before { render }
  it "displays the welcome page" do
    expect(rendered).to have_selector("h1", text: "Hello, Rails!")
    expect(rendered).to have_link("My Blog")
  end

end
