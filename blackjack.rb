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
    if card_value[0] && score < 11
        card_value[0] = 11
    elsif card_value[0] && score >= 11
        value_hash[0] == 1
    end
deck.each_with_index {|k,i|value_hash[k] = card_value[i]}

player_hand.push(next_card(shuffled_deck))
player_hand.push(next_card(shuffled_deck))

dealer_hand.push(next_card(shuffled_deck))
dealer_hand.push(next_card(shuffled_deck))

puts "Welcome to Blackjack!"
puts 

puts "Player was dealt #{player_hand[0]}"
puts "Player was dealt #{player_hand[1]}"

player_score = value_hash[player_hand[0]] + value_hash[player_hand[1]]

puts "Player score #{player_score}"

puts "hit or stand (h/s): "

input = gets.chomp
dealer_score = value_hash[dealer_hand[0]] + value_hash[dealer_hand[1]]

def score_hand(hand, value_hash)
  score = 0
  hand.each do |card|
    score += value_hash[card]
  end
  score
end

while input == "h" && player_score <= 21
  player_hand.push(next_card(shuffled_deck))
  puts "Player was dealt #{player_hand[2]}"
  player_score = player_score + value_hash[player_hand[-1]]
  puts "Player score #{player_score}"
  puts "hit or stand (h/s): "
  input = gets.chomp
end

puts "Dealer was dealt #{dealer_hand[0]}"
  puts "Dealer was dealt #{dealer_hand[1]}"
  puts "Dealer score #{dealer_score}"
  if dealer_score < 17 

  dealer_hand.push(next_card(shuffled_deck))
  dealer_score = dealer_score + value_hash[player_hand[-1]]
  # dealer_score = score_hand(dealer_hand, value_hash) #value_hash[dealer_hand[0]] + value_hash[dealer_hand[1]]
  
end
# while score_hand(dealer_hand, value_hash) < 17 
#   puts "Dealer was dealt #{dealer_hand[-1]}"
#    dealer_hand.push(next_card(shuffled_deck))
#   dealer_score = score_hand(dealer_hand, value_hash) 
#   puts "Dealer score #{dealer_score}"
# end




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