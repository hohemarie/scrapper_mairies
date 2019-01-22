require 'rubygems'
require "google_drive"
require 'json'
require 'nokogiri'
require 'open-uri'
require '../../db/emails.csv'
require '../../db/emails.json'
class Scrapper
	def save_as_JSON #capture url des villes du 95
		f = File.open("email.JSON","w")
		url2 = "http://www.annuaire-des-mairies.com/val-d-oise.html"
		doc2 = Nokogiri::HTML(open(url2))
		adresse2 = doc2.css('.lientxt')
		noms = []
		villes = []
		emails = []
		adresse2.each do |link|
	#noms.push(url2 + (link['href'][1..-1]))
			p="http://www.annuaire-des-mairies.com"	
	#puts link['href'][1..-1]
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
File.open("email.JSON","w") do |f|
	f.write(tempHash.to_json)
end
f.close
		#Hash[villes.zip(emails)].each do |ville,email|
			#f.puts(ville+" => "+email)
#my_hash=Hash[villes.zip(emails)]
#return my_hash(ville_entree)
		end
	def save_as_spreadsheet
		session = GoogleDrive::Session.from_vonfig("config.json")

ws = session.spreadsheet_by_key("pz7Xt1QC-PYx-jrVMJErTcg").worksheets[0]

p ws[2, 1]
g = File.open('email.JSON','w')
col1=1
lin1=2
col2=2
lin2=2
File.foreach( 'email.JSON' ) do |line|
	ligne=line.split("=>")
	ws[lin1,col1] = ligne[0]
	ws[lin2,col2] = ligne[1]
	ws.save
	lin1+=1
	lin2+=1
end	
		
end
#ws[2, 1] = "foo"
#ws[2, 2] = "bar"
#ws.save

(1..ws.num_rows).each do |row|
	(1..ws._num_cols).each do |col|
		p ws[row, col]
	end
def save_as_csv
	h = File.open("email.csv","a")
File.foreach ('email.JSON') do |line|
	ligne=line.split(" ")
	ligne2=ligne.delete("=>")
	h.puts(ligne2[0],',',ligne2[1..ligne2.length])
h.close

end
	
end
end

p ws.rows

ws.reload
	end