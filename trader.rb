require 'rubygems'
require 'nokogiri'   
require 'open-uri'

PAGE="https://coinmarketcap.com/all/views/all/"

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
    puts "C'était les valeurs crypto pour cette heure"
    sleep (20)
    t=20
        while t != 3600
        system('clear')
        print "Prochaine mise à jour dans 1 heure"
        sleep (1)
        t+=1
        print '.'
        sleep (1)
        t+=1
        print '.'
        sleep (1)
        t+=1
        print '.'
        sleep (1)
        t+=1
        print '.'
        sleep (1)
        t+=1
        print '.'
        sleep(3)
        t+=3
        end
    puts "Chargement des nouvelles valeurs"
    end
end
get_market(PAGE)
