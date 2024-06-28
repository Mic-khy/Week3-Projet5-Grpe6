
require 'launchy'

# Vérifie si l'utilisateur a fourni des arguments
if ARGV.empty?
  puts "Usage: ruby google_searcher.rb <search query>"
  exit
end

# Récupère les arguments de la ligne de commande et les joint avec des '+'
search_query = ARGV.join('+')

# Construit l'URL de recherche Google
url = "https://www.google.com/search?q=#{search_query}"

# Ouvre l'URL dans le navigateur par défaut
Launchy.open(url)
