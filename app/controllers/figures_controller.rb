require 'pry'
class FiguresController < ApplicationController

  get '/' do
    erb :index
  end

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/new' do
    @figures = Figure.all
    #binding.pry
    erb :'/figures/new'

  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      @figure.titles << title
    elsif !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end
    @figure.save

    redirect to ("figures/#{@figure.id}")
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])

    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    #binding.pry
    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      @figure.titles << title
    elsif !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark][:name])
      @figure.landmarks << landmark
    end
    redirect to ("figures/#{@figure.id}")
  end
end
