require 'sinatra/base'
require_relative 'models/link'

class DataRecorder < Sinatra::Base

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    @title = params[:Title]
    @url = params[:url]
    @link = Link.create(title: @title, url: @url)
    redirect :links
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
