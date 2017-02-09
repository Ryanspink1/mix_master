require 'rails_helper'

RSpec.feature "User edits an playlists attributes" do
  scenario "they see updated attributes for that playlist" do
    playlist            = create(:playlist_with_songs)
    play_one, play_two, play_three = playlist.songs
    new_song            = create(:song, title: "New Song")

    visit playlist_path(playlist)
    click_on "Edit"
    uncheck("song-#{play_one.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content playlist.name
    expect(page).to_not have_content play_one.title
    expect(page).to have_content new_song.title
  end
end
