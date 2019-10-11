require 'launchy'


#rejeter si l'utilisateur ne tape rien après
def check_if_user_gave_input
  abort("Il fallait rentrer ta recherche hiiin") if ARGV.empty?
end

#choppe ce que l'utilisateur tape après le lancement du doc
def get_search_name
  return search_name = ARGV * "+" # le * " " permet de passer de array à string, tout cpmme .join("+")
end

def make_search(name)
  Launchy.open("http://google.fr/search?q=#{name}")
end

def perform
	check_if_user_gave_input
	make_search(get_search_name)
end


perform

