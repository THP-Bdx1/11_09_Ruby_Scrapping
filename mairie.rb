require 'rubygems'
require 'nokogiri'   
require 'open-uri'

PAGE1="http://annuaire-des-mairies.com/val-d-oise.html"
PAGE2="http://annuaire-des-mairies.com/95/vaureal.html"

def get_the_email_of_a_townhal_from_its_webpage(name, page_url)
liste_temp=Hash.new
page_url=page_url[1..-1]
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+page_url))
email=page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
email.each{|mail| liste_temp["name"]=name
                  liste_temp["email"]= mail.text
                @hash_mairie.push(liste_temp)}

end
#get_the_email_of_a_townhal_from_its_webpage(PAGE2)


def get_all_the_urls_of_val_doise_townhalls(page_url)
@hash_mairie=Array.new
page = Nokogiri::HTML(open(page_url))
noob = page.css('a.lientxt')
noob.each{|url| get_the_email_of_a_townhal_from_its_webpage(url.text, url['href'])}
puts @hash_mairie
end

get_all_the_urls_of_val_doise_townhalls(PAGE1)


=begin
def get_the_email_of_a_townhal_from_its_webpage(name, page_url)
page_url=page_url[1..-1]
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+page_url))
email=page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
email.each{|mail| @hash_mairie[name]=mail.text}
end
#get_the_email_of_a_townhal_from_its_webpage(PAGE2)


def get_all_the_urls_of_val_doise_townhalls(page_url)
@hash_mairie=Hash.new
page = Nokogiri::HTML(open(page_url))
noob = page.css('a.lientxt')
noob.each{|url| get_the_email_of_a_townhal_from_its_webpage(url.text, url['href'])}
puts @hash_mairie
end
=end

