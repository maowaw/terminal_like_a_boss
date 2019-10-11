
# bloque si l'utilisateur rentre plusieurs mots ou rien du tout
def check_if_user_gave_input
  abort("Nop, a folder in one argument plz") if ARGV.empty? && ARGV.length > 1 
end 

#choppe ce que l'utilisateur tape comme nom de dossier
def get_folder_name
  return folder_name = ARGV.first
end

#créé le dossier
def create_folder(name)
  Dir.mkdir(name)
end

#vérif de l'input et création du dossier
def folder_creation
check_if_user_gave_input
create_folder(get_folder_name)
end

#création du gemfile /!\ comme il est nouveau, bien le mettre en "w"
#le file.puts permet de rajouter à chaque ligne (un file est considéré comme un array de lignes)
def create_gemfile
	file = File.open("#{ARGV.first}/Gemfile", "w") {|file| file.puts "source 'https://rubygems.org'
	ruby '2.5.1'
		gem 'dotenv'
		gem 'rspec'
		gem 'twitter'
		gem 'rubucop'
		gem 'pry'
		gem 'nokogiri'
		gem 'launchy'" }
end

#tape git init
def git_init
	Dir.chdir(ARGV.first){
	system("git init")
}
end

#met le .env dans .gitignore
def create_env_ignore
	env = File.open("#{ARGV.first}/.env", "w") #Créé fichier .env, read&write
	git_ignore = File.open("#{ARGV.first}/.gitignore", "w")
	git_ignore.puts(".env")
end

def create_lib
  Dir.mkdir("#{ARGV.first}/lib")
end

def rspec
	Dir.chdir(ARGV.first){
		system("rspec --init")
	}
end

def create_readme
	read_me = File.open("#{ARGV.first}/README.md", "w") #Créé fichier Readme, read&write
	read_me.puts("Ceci est un programme ruby")
end


	folder_creation
	create_gemfile
	git_init
	create_env_ignore
	create_lib
	rspec
	create_readme

