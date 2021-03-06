require 'sinatra'
require './lib/geburtstagsspiel/QandA.rb'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"
enable :sessions
set :session_secret, 'mysessionsecret'

get '/' do
    erb :willkommen
end


post '/Ablauf/' do

$name = params[:name]
#---------------
class Player
  def index
  @spielername = $name
  end
  def get_binding # this is only a helper method to access the objects binding method
    binding()
  end
end

    spieler = Player.new
    spieler.index
#------------------
erb :Ablauf, :locals => {'name' => $name, 'spieler' => spieler.index}
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
#  $q = 0
#  $h = 0
  $score = 0
  $hinw = nil
  $antw = hints[$q][$h]
  erb :stadttour, :locals => {
    'antw' => $antw,
    'name' => $name,
    'score' => $score,
    'hinw' => $hinw,
    'hinweise' => hints[$q][1..$h],
    'h' => $h,
    'schade' => $schade,
    'nocheintipp' => $nocheintipp,
    'glueckwunsch' => $glueckwunsch
    }
  
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
  $points = 4 - $h
  $ziel = params[:ziel]
  @schade = nil
  if $ziel == antworten[$q]
    $score = $score + $points
    $h = 0
    $q += 1
    $glueckwunsch = "Yeah #{$points} Punkte für dich - auf gehts zu #{$ziel}"
    $antw = hints[$q][$h]
  else
    if $h == 3
      $score = $score + 0
      $h = 0
      $q += 1
      $schade = "Schade, leider hast du dieses Mal keine Punkte erreicht!"
      $antw = hints[$q][$h]
      
#      erb :nextziel, :locals => {
#        'antw' => $antw,
#        'name' => $name,
#        'score' => $score,
#        'hinw' => $hinw,
#        'hinweise' => hints[$q][1..$h],
#        'h' => $h,
#        'schade' => @schade,
#        'glueckwunsch' => @glueckwunsch
#       }
#      render :action => "nextziel"
      
    end
    
    if $h < 3    
      $h += 1
      $nocheintipp = "Nicht ganz, vielleicht hilft dir der nächste Hinweis weiter."
    end
  end
  
  erb :stadttour, :locals => {
    'antw' => $antw,
    'name' => $name,
    'score' => $score,
    'hinw' => $hinw,
    'hinweise' => hints[$q][1..$h],
    'h' => $h,
    'schade' => $schade,
    'nocheintipp' => $nocheintipp
    }
  
end

#get '/nextziel/' do
#      erb :nextziel, :locals => {
#        'schade' => @schade,
#        'glueckwunsch' => @glueckwunsch
#        }
#end

post '/nextziel/' do
      erb :nextziel, :locals => {
        'antw' => $antw,
        'name' => $name,
        'score' => $score,
        'hinw' => $hinw,
        'h' => $h,
        'schade' => $schade,
        'glueckwunsch' => $glueckwunsch
       }
end