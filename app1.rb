require 'sinatra'
require './lib/geburtstagsspiel/QandA.rb'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
set :sessions,true



get '/' do
    erb :willkommen
end


post '/Ablauf/' do
    
@name = params[:name]
session[:werspielt] = @name
session[:h] = -1
session[:q] = 0
session[:points] = 5
session[:score] = 0
erb :Ablauf, :locals => {'name' => session[:werspielt] }
end


get '/stadttour' do
      
   F1 = [
 '"Dä Behrendt wenn dä he her zum Dreh kütt, dann langt dä öbbern Tresen in ming Schüssel för ne Handvoll Fritten."',  
 "Ballauf und Schenk",
 "Bummelmeile am Rhein mit edlen Designgeschäften in prächtig renovierten Speicherhäusern",
 "Alte Hafenkränen und drei übers Rheinufer in den Fluss ragenden Kranhäuser (eines der Wahrzeichen Kölns)"
 ]
 
 F2 = [
 'Weiter gehts zum alten Hauptzollamt.',
 'Gegründet durch das Kölner Traditionsunternehmen Stollwerck',
 'Ein Schiff aus Glas und Metall',
 'Es geht um ein Lebens- und Genussmittel aus Kakaoerzeugnissen und Zuckerarten.'
 ]
 
 F3 = [
 'Unser nächstes Ziel ist der Sitz der Europäischen Agentur für Flugsicherheit (EASA).',
 'Mit gut 100m Höhe, das zweihöhste Gebäude auf der Schäl Sick',
 'Dreieckiges Schlaginstrument',
 'Kölns schönster Blick auf den Dom'
 ]
 
 F4 = [
 'Sie wurde unter Kaiser Wilhelm im Jahr 1911 für 14 Millionen Mark erbaut.',
 '22 Tonnen Last der Liebe',
 'Mit etwa 1220 Zugfahrten pro Tag ist sie eine der meistbefahrenen Eisenbahnbrücken in Deutschland.',
 'Ein Schloss am Rhein'
 ]
 
 F5 = [
 'Hier stand bereits 1544 das "Zum Kranz" eines der Beliebtesten in Köln.',
 'Es gehört zur Radeberger Gruppe',
 'Heute steht hier eins der Jüngsten Kölns. Es trägt einen häufigen Vornamen.',
 'Traditionsbrauerei Peters & Bambeck - Familientradition seit 1847'
 ]
 
 F6 = [
 'Auf zum „mercatus coloniae“ (Bezeichnung im Jahr 922 und seit 988 das „forum“ des römischen Köln).',
 'Hier steht das Jan von Werth Denkmal (Brunnen).',
 'Bunte Hüsjer',
 'Dreh- und Angelpunkt der Kölner Altstadt'
 ]
 
 F7 = [
 'Zu Beginn und zum Ende der jecken Jahreszeit steht er im Mittelpunkt des Interesses.',
 'Er hat eine Fläche von 16400 m² und ist damit nach dem Neumarkt der zweitgrößte Kölner Platz.',
 'Hier steht das Reiterstandbild für den preußischen König Friedrich Wilhelm III.',
 'Er ist ganz in der Nähe'
 ]
 
 F8 = [
 'Unser Ziel ist der Geburtsort zweier großer deutscher Fernsehstars',
 'Sie tragen die Farben "lila" und "orange".',
 'Ein Platz mit hoher kultureller Bedeutung, denn hier befindet sich das Kölner Opern- und Schauspielhausensemble.',
 'Ein bekannter Schriftzug bringt das Kölner Selbstverständnis zum Ausdruck "Liebe deine Stadt"'
 ]
 
 
hints = [
  F1,
  F2,
  F3,
  F4,
  F5,
  F6,
  F7,
  F8
  ] 
 
 
 antworten = [
  'Rheinauhafen',
  'Schokoladenmuseum',
  'Koeln Triangle',
  'Hohenzollernbruecke',
  'Peters Brauhaus',
  'Alter Markt',
  'Heumarkt',
  'WDR Arcaden'
 ]
if session[:h] >= 0
    session[:h] = -1
    session[:q] += 1
end

 
    # ACHTUNG h und q gleich 0 null muss von vorher noch mitgegeben werden 
    session[:antw] = hints[session[:q]][0]
    session[:ziel] = params[:ziel]
    
    #neuer Hinweis bei falscher Antwort oder Anforderung eines neuen Hinweises
    if session[:ziel] != antworten[session[:q]] && session[:h] < 3
            $route = "G1"
        session[:h] += 1
        session[:points] -= 1
        session[:nocheintipp] = "Vielleicht hilft dir der nächste Hinweis weiter."
        erb :stadttour, :locals => {
          'antw' => session[:antw],
          'name' => session[:name],
          'points' => session[:points],
          'score' => session[:score],
          'hinw' => session[:hinw],
          'hinweise' => hints[session[:q]][1..session[:h]],
          'h' => session[:h],
          'nocheintipp' => session[:nocheintipp],
          'ziel' => session[:ziel],
          'route' => $route          
          }    
        
    #Frage nicht gelöst -> keine Punkte, weiter zum Ziel    
    elsif session[:ziel] != antworten[session[:q]] && session[:h] == 3
            $route = "G2"
          session[:points] = 0
          session[:score] = session[:score] + session[:points]
          session[:points] = 5
          session[:h] = -1          
          erb :nextziel, :locals => {
            'q' => session[:q],
            'h' => session[:h],        
            'name' => session[:name],
            'score' => session[:score],
            'hinw' => session[:hinw],
            'ziel' => session[:ziel],
            'route' => $route            
           }
          
    #Frage richtig beantwortet -> entsprechend viele Punkte, weiter zum Ziel
    elsif session[:ziel] == antworten[session[:q]]
            $route = "G3"
          session[:score] = session[:score] + session[:points]
          session[:points] = 5          
          session[:h] = -1          
          erb :nextziel, :locals => {
            'q' => session[:q],
            'h' => session[:h],        
            'name' => session[:name],
            'score' => session[:score],
            'hinw' => session[:hinw],
            'ziel' => session[:ziel],
            'route' => $route            
           }
    end

end

post '/stadttour' do
  
   F1 = [
 '"Dä Behrendt wenn dä he her zum Dreh kütt, dann langt dä öbbern Tresen in ming Schüssel för ne Handvoll Fritten."',  
 "Ballauf und Schenk",
 "Bummelmeile am Rhein mit edlen Designgeschäften in prächtig renovierten Speicherhäusern",
 "Alte Hafenkränen und drei übers Rheinufer in den Fluss ragenden Kranhäuser (eines der Wahrzeichen Kölns)"
 ]
 
 F2 = [
 'Weiter gehts zum alten Hauptzollamt.',
 'Gegründet durch das Kölner Traditionsunternehmen Stollwerck',
 'Ein Schiff aus Glas und Metall',
 'Es geht um ein Lebens- und Genussmittel aus Kakaoerzeugnissen und Zuckerarten.'
 ]
 
 F3 = [
 'Unser nächstes Ziel ist der Sitz der Europäischen Agentur für Flugsicherheit (EASA).',
 'Mit gut 100m Höhe, das zweihöhste Gebäude auf der Schäl Sick',
 'Dreieckiges Schlaginstrument',
 'Kölns schönster Blick auf den Dom'
 ]
 
 F4 = [
 'Sie wurde unter Kaiser Wilhelm im Jahr 1911 für 14 Millionen Mark erbaut.',
 '22 Tonnen Last der Liebe',
 'Mit etwa 1220 Zugfahrten pro Tag ist sie eine der meistbefahrenen Eisenbahnbrücken in Deutschland.',
 'Ein Schloss am Rhein'
 ]
 
 F5 = [
 'Hier stand bereits 1544 das "Zum Kranz" eines der Beliebtesten in Köln.',
 'Es gehört zur Radeberger Gruppe',
 'Heute steht hier eins der Jüngsten Kölns. Es trägt einen häufigen Vornamen.',
 'Traditionsbrauerei Peters & Bambeck - Familientradition seit 1847'
 ]
 
 F6 = [
 'Auf zum „mercatus coloniae“ (Bezeichnung im Jahr 922 und seit 988 das „forum“ des römischen Köln).',
 'Hier steht das Jan von Werth Denkmal (Brunnen).',
 'Bunte Hüsjer',
 'Dreh- und Angelpunkt der Kölner Altstadt'
 ]
 
 F7 = [
 'Zu Beginn und zum Ende der jecken Jahreszeit steht er im Mittelpunkt des Interesses.',
 'Er hat eine Fläche von 16400 m² und ist damit nach dem Neumarkt der zweitgrößte Kölner Platz.',
 'Hier steht das Reiterstandbild für den preußischen König Friedrich Wilhelm III.',
 'Er ist ganz in der Nähe'
 ]
 
 F8 = [
 'Unser Ziel ist der Geburtsort zweier großer deutscher Fernsehstars',
 'Sie tragen die Farben "lila" und "orange".',
 'Ein Platz mit hoher kultureller Bedeutung, denn hier befindet sich das Kölner Opern- und Schauspielhausensemble.',
 'Ein bekannter Schriftzug bringt das Kölner Selbstverständnis zum Ausdruck "Liebe deine Stadt"'
 ]
 
 
hints = [
  F1,
  F2,
  F3,
  F4,
  F5,
  F6,
  F7,
  F8
  ] 
 
 
 antworten = [
  'Rheinauhafen',
  'Schokoladenmuseum',
  'Koeln Triangle',
  'Hohenzollernbruecke',
  'Peters Brauhaus',
  'Alter Markt',
  'Heumarkt',
  'WDR Arcaden'
 ]
 
 # User kommt an:
 # Punkte = 4
 # Frage = 0
 # Hinweise = 0
 # mit jeder flaschen Antwort: Punkte - 1 / Hinweise + 1

#if session[:h] == 3
#    session[:h] = -1
#    session[:q] += 1
#end

    # ACHTUNG h und q gleich 0 null muss von vorher noch mitgegeben werden 
    session[:antw] = hints[session[:q]][0]
    
    session[:ziel] = params[:ziel]
    
    #neuer Hinweis bei falscher Antwort oder Anforderung eines neuen Hinweises
    if session[:ziel] != antworten[session[:q]] && session[:h] < 3
          $route = "P1"
        session[:h] += 1
        session[:points] -= 1
        session[:nocheintipp] = "Vielleicht hilft dir der nächste Hinweis weiter."
        erb :stadttour, :locals => {
          'antw' => session[:antw],
          'name' => session[:name],
          'points' => session[:points],
          'score' => session[:score],
          'hinw' => session[:hinw],
          'hinweise' => hints[session[:q]][1..session[:h]],
          'h' => session[:h],
          'nocheintipp' => session[:nocheintipp],
          'ziel' => session[:ziel],
          'route' => $route          
          }    
        
    #Frage nicht gelöst -> keine Punkte, weiter zum Ziel    
    elsif session[:ziel] != antworten[session[:q]] && session[:h] == 3
            $route = "P2"
          session[:points] = 0
          session[:score] = session[:score] + session[:points]  
          session[:points] = 5
          session[:h] = -1
          session[:q] += 1
          erb :nextziel, :locals => {
            'q' => session[:q],
            'h' => session[:h],        
            'name' => session[:name],
            'score' => session[:score],
            'hinw' => session[:hinw],
            'ziel' => session[:ziel],
            'route' => $route            
           }
          
    #Frage richtig beantwortet -> entsprechend viele Punkte, weiter zum Ziel
    elsif session[:ziel] == antworten[session[:q]]
            $route = "P3"
          session[:score] = session[:score] + session[:points]
          session[:h] = -1
          session[:points] = 5
          session[:q] += 1
          erb :nextziel, :locals => {
            'q' => session[:q],
            'h' => session[:h],        
            'name' => session[:name],
            'score' => session[:score],
            'hinw' => session[:hinw],
            'ziel' => session[:ziel],
            'route' => $route
           }
    end   
 

  
end


post '/nextziel/' do
    
    if session[:q] == 7
        erb :spielende, :locals => {
        'name' => session[:name],
        'score' => session[:score],
        'ziel' => session[:ziel]              
        }
    end
    
    
    session[:points] = 5
    
      erb :nextziel, :locals => {
        'q' => session[:q],
        'h' => session[:h],        
        'name' => session[:name],
        'score' => session[:score],
        'hinw' => session[:hinw],
        'ziel' => session[:ziel]      
       }
end

get '/spielende' do
        erb :spielende, :locals => {
        'name' => session[:name],
        'score' => session[:score],
        'ziel' => session[:ziel]              
        }
end