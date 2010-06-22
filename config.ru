require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra/base'
require 'datamapper'

if File.exist?(File.expand_path('config/database.yml', File.dirname(__FILE__)))
  dbinfo = YAML.load(File.read(File.expand_path(File.join(File.dirname(__FILE__), "config", "database.yml"))))[ENV["RACK_ENV"] || 'development']
  DataMapper.setup(:default, "#{dbinfo['adapter']}://#{dbinfo['username']}:#{dbinfo['password']}@#{dbinfo['host']}/#{dbinfo['database']}")
end

class Cow
  include DataMapper::Resource

  property :id,   Serial
  property :name, String
end

class SinatraApp < Sinatra::Base
  get '/' do
    "Dinky little Sinatra app is up and running, matey!"
  end

  get '/cow' do
    Cow.create(:name => params[:name])
    "moo"
  end
end

run SinatraApp
