require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class DataRecorder < Sinatra::Base

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    @title = params[:Title]
    @url = params[:url]
    link = Link.create(title: @title, url: @url)
    tag = Tag.new(name:params[:Tag])
    link.tags << tag
    link.save
    tag.save
    redirect :links
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/tag/kittens' do
    @kittens = 'kittens'
    @search_tag = Link.all(:tags => {:name => @kittens})
    p @search_tag
    erb :'links/kittens'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
