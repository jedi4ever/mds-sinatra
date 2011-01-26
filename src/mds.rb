#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'redis'
require 'sinatra/async'


class Mds < Sinatra::Application
  register Sinatra::Async 

  redis= Redis.new
     
  aget '/' do
    body "This is a test message #{params[:name]}"
  end

  get '/count' do
    redis.get "#{params[:channel]}"
  end
  
	post '/zap' do
    redis.incr "#{params[:channel]}"
  #  redis.decr "#{params[:old]}"
    "Zapping from #{params[:old]} to #{params[:new]}"
	end
end