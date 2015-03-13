require 'rubygems'
require 'net/ftp'
require 'sinatra'

get '/' do
  "Les choix sont: /commande/<numéro de produit>"
end



get '/commande/:noproduit' do 
  # the param[] hash stores querystring and form data
  @noprod = params[:noproduit].to_sym
  Net::FTP.open('example.com') do |ftp|
    ftp.login
    files = ftp.chdir('pub/commande/fidelio/landing')
  
    ftp.getbinaryfile('nif.rb-0.91.gz', 'nif.gz', 1024)
  end
  erb :filtre2
end


