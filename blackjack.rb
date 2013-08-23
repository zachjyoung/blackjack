#!/usr/bin/env ruby
# encoding: UTF-8

player_hand = []
dealer_hand = []

player_score = 0
dealer_score = 0

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

def next_card(shuffle)
  shuffle.pop
end

deck = build_deck
shuffled_deck = deck.shuffle
 
value_hash = {}

card_value = [2,3,4,5,6,7,8,9,10,10,10,10,0,2,3,4,5,6,7,8,9,10,10,10,10,0,2,3,4,5,6,7,8,9,10,10,10,10,0,2,3,4,5,6,7,8,9,10,10,10,10,0]

deck.each_with_index {|k,i|value_hash[k] = card_value[i]}

player_hand.push(next_card(shuffled_deck))
player_hand.push(next_card(shuffled_deck))

dealer_hand.push(next_card(shuffled_deck))
dealer_hand.push(next_card(shuffled_deck))

puts "Welcome to Blackjack!"
puts 

puts "Player was dealt #{player_hand[0]}"
puts "Player was dealt #{player_hand[1]}"

# puts "Player score #{player_score}"

puts "hit or stand (h/s): "

input = gets.chomp

if input == "h"
  player_hand.push(next_card(shuffled_deck))
elsif input == "s"
  # puts "Player score #{player_score}"
  puts "Dealer was dealt #{dealer_hand[0]}"
  puts "Dealer was dealt #{dealer_hand[1]}"
  # puts "Dealer score #{dealer_score}"
end


  


# puts player_hand[0]

# puts player_hand

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