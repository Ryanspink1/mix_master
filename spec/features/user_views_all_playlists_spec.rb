require 'rails_helper'

RSpec.feature "User sees each playlist in database" do
  scenario "user visits the playlist index" do

    p1, p2, p3 = create_list(:playlist, 3)
    playlists = [p1, p2, p3]

    visit playlists_path

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end
end
