import json
import csv

input_file = '../pokedex.csv'
output_file = '../pokedex.json'

pokedex = {'pokemons': []}

with open(input_file) as csvfile:
    reader = csv.reader(csvfile)
    next(reader, None) # Skip headers
    for row in reader:
        name, types, evolution = row
        types = types.split(' ')
        evolution = evolution.split(' ')
        # FIXME: This does not take into account special characters for imgName
        # Currently, there is not much work involved in manually fixing it but this definitely needs to be improved
        pokedex['pokemons'].append({'name': name, 'types': types, 'evolutionaryLine': evolution, 'imgName': name.lower()})

with open(output_file, 'w') as f:
    json.dump(pokedex, f, indent=4)

