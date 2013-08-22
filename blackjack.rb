#!/usr/bin/env ruby
# encoding: UTF-8


player_hand = []

SUITS = ['♠', '♣', '♥', '♦']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def build_deck
  deck = []

  SUITS.each do |suit|
    VALUES.each do |value|
      deck.push(value + suit)
    end
  end
  return deck
end


deck = build_deck
shuffled_deck = deck.shuffle
 
#Matching card score with card

demo_hash = {}

card_value = [2,3,4,5,6,7,8,9,10,10,10,10,0,2,3,4,5,6,7,8,9,10,10,10,10,0,2,3,4,5,6,7,8,9,10,10,10,10,0,2,3,4,5,6,7,8,9,10,10,10,10,0]

deck.each_with_index {|k,i|demo_hash[k] = card_value[i]}
####### End Matching ##########3


2.times do |card|
  player_hand = shuffled_deck.pop(card)
end


puts player_hand
puts demo_hash

next_card = shuffled_deck.pop

puts next_card

puts demo_hash.fetch(next_card)




# As a player
# I want to be prompted to hit or stand
# So that I know when I have to act

# As a player
# I want to know my current best possible score
# So that I can decide whether to hit or stand

# As a player
# I want to hit
# So that I can increase my score

# As a player
# I want to stand
# So that I don't bust

# As a dealer
# I want to continue hitting until my score is at least 17
# So that I get close to 21 without too much risk of busting.