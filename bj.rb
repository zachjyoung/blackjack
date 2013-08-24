
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
player_hand
player_score = score_hand(player_hand, value_hash)
puts "Player score #{player_score}"

puts "hit or stand (h/s): "

input = gets.chomp

def score_hand(hand, value_hash)
  score = 0
  hand.each do |card|
    if value_hash[card] == 0 && score < 11
        value_hash[card] == 11
    elsif value_hash[card] == 0 && score >= 11
        value_hash[card] == 1
    end
    score += value_hash[card]
  end
  score
end

while input == "h" && score_hand(player_hand, value_hash) <= 21
  player_hand.push(next_card(shuffled_deck))
  puts "Player was dealt #{player_hand[-1]}"
 player_hand.push(next_card(shuffled_deck))
  player_score = score_hand(player_hand, value_hash)
  puts "Player score #{player_score}"
  puts "hit or stand (h/s): "
  input = gets.chomp
end
puts "Dealer was dealt #{dealer_hand[0]}"
  puts "Dealer was dealt #{dealer_hand[1]}"
while score_hand(dealer_hand, value_hash) < 17 
  puts "Dealer was dealt #{dealer_hand[-1]}"
   dealer_hand.push(next_card(shuffled_deck))
  dealer_score = score_hand(dealer_hand, value_hash) 
  puts "Dealer score #{dealer_score}"
end
