require 'rubygems'
require 'nokogiri'   
require 'open-uri'

PAGE="https://coinmarketcap.com/all/views/all/"


=begin
def get_crypto_name(page_url)
page = Nokogiri::HTML(open(PAGE1))
name=page.css('a.currency-name-container')
name.each {|currency| currency_name=Hash.new
currency_name["Coin"]=currency.text
@currencies.push(currency_name)}
print @currencies
end

get_crypto_name(PAGE)

def get_crypto_value(page_url)
page = Nokogiri::HTML(open(PAGE1))
nioc=page.css('a.price')
nioc.each {|currency| currency_value=Hash.new
currency_value["Value"]=currency.text
@currencies.push(currency_value)}
print @currencies
end

get_crypto_value(PAGE)
=end

=begin
def get_market(page_url)
page = Nokogiri::HTML(open(PAGE))

name=page.css('a.currency-name-container')
name.each {|currency| currency_name=Hash.new
currency_name["Coin"]=currency.text
@currencies.push(currency_name)}

nioc=page.css('a.price')
nioc.each {|currency| currency_value=Hash.new
currency_value["Value"]=currency.text
@currencies.push(currency_value)}
print @currencies

end
=end

def get_market(page_url)
    loop do
page = Nokogiri::HTML(open(page_url))
currencies=Array.new
currency_name=Array.new
currency_value=Array.new
page.css('a.currency-name-container').each do |currency|
    currency_name << currency.text
    end
page.css('a.price').each do |currency| 
    currency_value << currency.text
    end
    c=0
    currency_name.length.times do |var|
    temp_hash=Hash.new
    temp_hash["name"]=currency_name[c]
    temp_hash["value"]=currency_value[c]
    currencies << temp_hash
    c+=1
    end
puts currencies
puts
puts "C'était les valeurs crypto pour cette heure"
sleep (3600)
puts "Chargement des nouvelles valeurs"
end
end
get_market(PAGE)
