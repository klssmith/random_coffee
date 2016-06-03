module MakeDrawHelper
  def make_draw_and_view
    visit "/matches/new"
    click_link "Make the draw"
  end
end

RSpec.configure do |config|
  config.include MakeDrawHelper, type: :feature
end
