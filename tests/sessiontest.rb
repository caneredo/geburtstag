require 'rubygems'
require 'sinatra'

enable :sessions

get '/' do
  session["value"] ||= "Hello world!"
  "The cookie you've created contains the value: #{session["value"]}"
end