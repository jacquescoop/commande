# encoding: UTF-8
require 'sinatra'
require 'sinatra/cookies'
require 'mysql2'

@@mysqlclient = Mysql2::Client.new(:host => "127.0.0.1", :username => "root", :password => "l1ferre2", :database => "commande")

get '/' do
"La syntaxe requise est: /commande/"
end

get '/commande/' do
  @user = cookies[:username]

  if @user == nil ## no cookie present: must login
    redirect "http://127.0.0.1/commande/index.html"
  end
  ## va chercher les 3 produits de @user... plus tard pour contacts
  res = Array.new
  ##result = @@mysqlclient.query("select * from produit where acheteur = #{@user}",:as => :array)
  result = @@mysqlclient.query("select * from produit where acheteur = 'marc'",:as => :array)
  result.each do |row|
    res.push(row)
  end
  return res.to_s
end

##Pour fins de debug
get '/cookie' do
  "value: #{cookies[:username]}"
end

post '/login/' do
  @username = params[:Username]
  cookies[:username] = @username.to_s
  redirect 'http://127.0.0.1:4567/commande/'
end
