require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class DataRecorder < Sinatra::Base
  enable :sessions

  get '/'do
    redirect :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title],
                       url: params[:url])
    (params[:tag]).split.each do |tag|
      tag = Tag.new(name:tag)
      link.tags << tag
    end
    link.save
    p link
    redirect :links
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/tags' do
    session[:searched_tag] = params[:tag_searched]
    tag = Tag.all(name: session[:searched_tag])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
