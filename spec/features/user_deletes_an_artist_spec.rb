require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they are redirected to artist index without deleted artist" do
    artist = Artist.create(name: "Umphrey", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to_not have_content artist.name
  end
end
