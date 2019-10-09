# coding: utf-8
class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render json: @artists
  end

  def create
    @artist = Artist.create(artist: params[:artist])
    render json: @artist
  end

  def show
    @artists = Artist.all
    @albums = Album.all
    render json: @artists
  end
  
  def register
    @artists = Artist.all
    @albums = Album.all
    # postされたデータの取得
    @newalbum = params[:album]
    flag = false
    albumflag = false
    artistid = 0
    @newalbum.each do |each_data|
      if @artists.empty?
        @addartist = Artist.create(artist: each_data['artistname'])
        @addalbum = Album.create(artistid: @addartist.id, album: each_data['albumname'])
      else
        @artists.each do |each_artist|
          if each_artist.artist == each_data['artistname']
            flag = true
            artistid = each_artist.id
          end
        end
        
        artistid = Artist.create(artist: each_data['artistname']).id if flag == false

        if @albums.empty?
          Album.create(artistid: artistid, album: each_data['albumname'])
        else
          @albums.each do |each_album|
            if each_album.album == each_data['albumname']
              albumflag = true
              break
            end
          end
          Album.create(artistid: artistid, album: each_data['albumname']) if albumflag == false
        end
      end
      flag = false
      albumflag = false
    end
    render json: @newalbum
  end
end
