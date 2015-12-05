# encoding: utf-8

require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra/base'
require 'wiringpi'
require 'tilt/erb'
require 'yaml'

class Main < Sinatra::Base

  configure do
    set :environment, :production
    enable :sessions, :logging
    file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
    file.sync = true
    use Rack::CommonLogger, file
    config = YAML.load_file("#{settings.root}/config/config.yml")
    set :place, config['place']
    set :devices, config['devices']
    set :io, WiringPi::GPIO.new
    settings.devices.keys.each { |pin| settings.io.pin_mode pin, WiringPi::OUTPUT }
  end

  get '/' do
    devices = {}
    settings.devices.each do |pin, name|
      state = settings.io.digital_read pin
      devices[pin] = { :name => name, :state => state }
    end
    erb :devices_states, :locals => { :place => settings.place, :devices => devices }
  end

  get '/toggle/:pin' do
    pin = params['pin'].to_i
    if settings.devices.has_key? pin
      current_state = settings.io.digital_read pin
      settings.io.digital_write pin, (current_state + 1) % 2
    end
    redirect('/') 
  end

  get '/switch/:state/:pin' do
    pin = params['pin'].to_i
    state = params['state'].downcase
    if settings.devices.has_key? pin && state =~ /(on|off)/
      settings.io.digital_write pin, state == 'on' ? 0 : 1
    end
    redirect('/')
  end

  not_found do
    redirect to('http://www.google.com')
  end

end
