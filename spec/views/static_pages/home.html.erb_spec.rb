require "rails_helper"

RSpec.describe "static_pages/home.html.erb", type: :view do
  before do
    @new_tour = Tour.all
    render
  end

  it "displays the h3" do
    expect(rendered).to have_css "h3", text: I18n.t("static_pages.home.new_tour")
  end

  it "3 class carousel-inner and 3 class carousel-item" do
    expect(rendered).to have_css ".carousel-inner>.carousel-item", count: 3
  end

  it "1 id slide" do
    expect(rendered).to have_css "#slide", count: 1
  end

  it "render search" do
    expect(view).to render_template("static_pages/_search")
  end

  it "have view_all" do
    expect(response.body).to match(I18n.t "static_pages.home.view_all")
  end
end
