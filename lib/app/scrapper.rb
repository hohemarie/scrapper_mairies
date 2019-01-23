$:.unshift File.expand_path("./../lib/app", __FILE__)
require 'scrapper'

require 'rubygems'
require "google_drive"
require 'json'
require 'nokogiri'
require 'open-uri'
require '../../db/emails.csv'
require '../../db/emails.json'
class Scrapper
  def save_as_JSON(url) #capture url des villes du 95
    doc2 = Nokogiri::HTML(open(url2))
    adresse2 = doc2.css('.lientxt')
    noms = []
    villes = []
    emails = []
    adresse2.each do |link|
      p="http://www.annuaire-des-mairies.com"	
      p+=link['href'][1..-1]
      noms << p
      q=link['href'][1..-1]
      r=q.split('/')
      s=r[2]
      t=s.split('.')		
      ville=t[0]
      villes << ville	
    end
    noms.each do |adresse|
      doc3 = Nokogiri::HTML(open(adresse))
      adresse3 = doc3.css(".txt-primary")[3].text.split(" ")[2]
      if ['@'].include?(adresse3) == true
        emails << adresse3.to_s
      else
        emails << nil
      end
	
    end
    tempHash=Hash[villes.zip(emails)]
    File.open("email.JSON","w") do |fichier_json|
      fichier_json.write(tempHash.to_json)
    end
    fichier_json.close

  end

  def save_as_spreadsheet(fichier_json)
    session = GoogleDrive::Session.from_config("config.json")

    ws = session.spreadsheet_by_key("pz7Xt1QC-PYx-jrVMJErTcg").worksheets[0]

    p ws[2, 1]
    g = File.open(fichier_json,'w')
    col1=1
    lin1=2
    col2=2
    lin2=2
    File.foreach(fichier_json) do |line|
      ligne=line.split("=>")
      ws[lin1,col1] = ligne[0]
      ws[lin2,col2] = ligne[1]
      ws.save
      lin1+=1
      lin2+=1
    end	
  end
  def save_as_csv(fichier_json)
    h = File.open("email.csv","a")
    File.foreach (fichier_json) do |line|
      ligne=line.split(" ")
      ligne2=ligne.delete("=>")
      h.puts(ligne2[0]+','+ligne2[1..ligne2.length]+'\n')
      h.close
    end
	
  end
end

