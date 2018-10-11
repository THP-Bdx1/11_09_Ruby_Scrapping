require 'rubygems'
require 'nokogiri'   
require 'open-uri'

PAGE="http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

def get_email(page_depute_url)
temp_mail_list=Array.new
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr"+page_depute_url))
email=page.css('a.email')
email.each {|mail| 
temp_mail_list << mail['href'][7..-1]}
return temp_mail_list
end

=begin
def get_email_again(page_depute_url)
temp_mail_list=Array.new
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr"+page_depute_url))
email=page.css('a.email')
email.each {|mail| 
temp_mail_list << mail['href'][7..-1]}
print temp_mail_list
end
get_email_again("/deputes/fiche/OMC_PA508")
=end

def get_url_name(page_url)
url_depute=Array.new
full_name=Array.new
first_name=Array.new
just_name=Array.new
list_depute=Array.new
mail_list=Array.new
page = Nokogiri::HTML(open(page_url))
dep = page.css('div#deputes-list ul li a')
dep.each{|url| 
url_depute << url['href']
full_name << url.text.split(' ')
}
    full_name.each do |k|
    first_name << k[1]
    just_name << k[2]
    end
    url_depute.each do |k|
    mail_list << get_email(k)
    end
c=0
    first_name.length.times do |var|
    temp_hash=Hash.new
    temp_hash["Prénom"]=first_name[c]
    temp_hash["Nom"]=just_name[c]
    temp_hash["Mail"]=mail_list[c]
    list_depute << temp_hash
    c+=1
    end
p list_depute
end

get_url_name(PAGE)


