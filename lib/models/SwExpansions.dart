Map<String, String> setNameFromNumber = {
  '1': 'Premiere',
  '2': 'A New Hope',
  '3': 'Hoth',
  '4': 'Dagobah',
  '5': 'Cloud City',
  '6': "Jabba's Palace",
  '7': 'Special Edition',
  '8': 'Endor',
  '9': 'Death Star II',
  '10': 'Reflections II',
  '11': 'Tatooine',
  '12': 'Coruscant',
  '13': 'Reflections III',
  '14': 'Theed Palace',
  '101': 'Premiere Introductory 2-Player Game',
  '102': 'Jedi Pack',
  '103': 'Rebel Leaders Pack',
  '104': 'Empire Strikes Back Introductory 2-Player Game',
  '105': 'First Anthology',
  '106': 'Official Tournament Sealed Deck',
  '107': 'Second Anthology',
  '108': 'Enhanced Premiere Pack',
  '109': 'Enhanced Cloud City',
  '110': "Enhanced Jabba's Palace",
  '111': 'Third Anthology',
  '112': "Jabba's Palace Sealed Deck",
  '200': 'Virtual Set 1',
  '200d': 'Virtual Set Defensive Shields',
  '201': 'Virtual Set 2',
  '202': 'Virtual Set 3',
  '203': 'Virtual Set 4',
  '204': 'Virtual Set 5',
  '205': 'Virtual Set 6',
  '206': 'Virtual Set 7',
  '207': 'Virtual Set 8',
  '208': 'Virtual Set 9',
  '209': 'Virtual Set 10',
  '210': 'Virtual Set 11',
  '211': 'Virtual Set 12',
  '212': 'Virtual Set 13',
  '213': 'Virtual Set 14',
  '214': 'Virtual Set 15',
  '301': 'Virtual Demo Set',
};

setName(String id) => setNameFromNumber[id];
