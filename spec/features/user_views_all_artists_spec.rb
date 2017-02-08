require 'rails_helper'

RSpec.feature "User sees each artist in database" do
  scenario "user visits the artists index" do

    artist = Artist.create(name:"Bob", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artists_path

    expect(page).to have_link artist.name, href: artist_path(artist)

  end
end
