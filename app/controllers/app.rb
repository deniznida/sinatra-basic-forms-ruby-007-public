class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}

  get '/' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  post '/update' do
    @song = Song.find(params[:id])
    @song.title = params[:title] 
    @song.artist = params[:artist] 
    @song.genre = params[:genre] 
    @song.album = params[:album] 
    @song.save
    

    redirect '/songs/'+ params[:id]
  end
end

