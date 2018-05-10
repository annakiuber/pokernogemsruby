def hand_builder()
faces = "AJKQT98765432"
suits = "cdhs"
deck = []
hands = {}
  faces.each_byte do |f|
    suits.each_byte do |s|
       deck.push(f.chr + s.chr)
       # Shuffles the deck array after the faces and suits characters have been added together into one array
       deck = deck.shuffle!
    end
  end
  hand1 = deck.pop(5)
  hand2 = deck.pop(5)
  # Takes the hands hash and sets key of hand1 equal to value of hand1 // If hand one does not exist as a key then it will be created // If hand1 does exist it will just update the value that is there
  hands["hand1"] = hand1
  hands["hand2"] = hand2

  hands
end

def cards(hand)
  suit_value = []
  face_value = []
  hand.each do |card|
    face_value << card[0]
    suit_value << card[1]
end

end

def face_changer(face_value)
  #maps elements of one array to another, converting each letter element to a number
  face_value = face_value.map do |face|
    if face == "A"
      14
    elsif face == "K"
      13
    elsif face == "Q"
      12
    elsif face == "J"
      11
    elsif face == "T"
      10
    else
      face.to_i
    end
  end
end

def hand_comparison(hands)
  starter_hands = hands.clone
  # p hands
  # p starter_hands
  starter_hands.each do |key,value|
  # p "this is hands only #{hands}"
    if royal_flush(value) == true
      starter_hands[key] = 100
    elsif straight_flush(value) == true
      starter_hands[key] = 90
    elsif four_of_a_kind(value) == true
      starter_hands[key] = 80
    elsif full_house(value) == true
      starter_hands[key] = 70
    elsif flush(value) == true
      starter_hands[key] = 60
    elsif straight(value) == true
      starter_hands[key] = 50
    elsif three_of_a_kind(value) == true
      starter_hands[key] = 40
    elsif two_pair(value) == true
      starter_hands[key] = 30
    elsif pair(value) == true
      starter_hands[key] = 20
    else high_card(value) == true
      starter_hands[key] = 10
    end
   # starter_hands
  end
   # hands['hand1']
   # hands['hand2']
  if starter_hands["hand1"] > starter_hands["hand2"]
      "starter hand1 is the winner"
    elsif starter_hands["hand1"] < starter_hands["hand2"]
      "starter hand2 is the winner"
    # else starter_hands['hand1'] == starter_hands['hand2']
      deal_with_tie(hands['hand1'],hands['hand2'])
    else starter_hands['hand1'] = starter_hands['hand2']
      # tie_breaker(hands['hand1'],hands['hand2'])
  end

end

def deal_with_tie(hand1,hand2)
  result = ""
  high_number = ""
  face_value1 = []
  face_value2 = []

  hand1.each do |card|
    face_value1 << card[0]
  end
  royal_hand1 = face_changer(face_value1)
  matches_array1 = royal_hand1.sort
  new_hand1 = matches_array1.group_by { |e| e }.select { |k, v| v.size.eql? 1 }.keys
  hand1_dupes = matches_array1.select{|item| matches_array1.count(item) > 1}.uniq
  matched_element1 = hand1_dupes.sum
  high_num1 = new_hand1.last


  hand2.each do |card|
    face_value2 << card[0]
  end
  royal_hand2 = face_changer(face_value2)
  matches_array2 = royal_hand2.sort
  new_hand2 = matches_array2.group_by { |e| e }.select { |k, v| v.size.eql? 1 }.keys
  p new_hand2
  hand2_dupes = matches_array2.select{|item| matches_array2.count(item) > 1}.uniq
  matched_element2 = hand2_dupes.sum
  high_num2 = new_hand2.last
  p high_num2

  if matched_element1 > matched_element2
    result = "hand1 is the winner"
  elsif matched_element1 < matched_element2
    result = "hand2 is the winner"
  else matched_element1 == matched_element2
    if high_num1 > high_num2
      high_number = "hand1 is the winner"
    else
      high_number = "hand2 is the winner"
    end
    high_number
  end
   # result
end



def tie_breaker(hand1,hand2)
  suit_value = []
  face_value = []
  array_sum1 = []
  array_sum2 = []
  result = ""
   "this is hand1 #{hand1}"
  hand1.each do |card|
     "this is each card #{card}"
    face_value << card[0]
    suit_value << card[1]
  end
    face_value = face_changer(face_value)
    face_value.sort!
    newarray1 = [*face_value[0]..face_value[0]+4]
    array_sum1 = newarray1.sum

  suit_value = []
  face_value = []
  hand2.each do |card|
    face_value << card[0]
    suit_value << card[1]
  end
    face_value = face_changer(face_value)
    face_value.sort!
    newarray2 = [*face_value[0]..face_value[0]+4]
    array_sum2 = newarray2.sum
    p "this is array_sum1 #{array_sum1} and array_sum2 #{array_sum2}!!!!!!!!!!!"
    if array_sum1 > array_sum2
      result = "hand1"
    else
      result = "hand2"
    end
    result
end

def royal_flush(hand)
  suit_value = [] #give an empty array to suit_value to be able to push each index position 1 into it in conditional below
  face_value = [] #give an empty array to face_value to be able to push each index position 0 into it in conditional below
  hand.each do |card| #iterates over each hand of cards
    face_value << card[0] #iterates over each card and pushed index position 0 into face_value array
    suit_value << card[1] #iterates over each card and pushed index position 1 into suit_value array
  end
  if suit_value.uniq.length == 1 #checks for duplication of index position 1 in each card that was pushed into suit_value; if it matches then it comes back 1 time
    if face_value.include?("A") && face_value.include?("K") && face_value.include?("Q") && face_value.include?("J") && face_value.include?("T") #if index position 0 of each card in face_value array and returns all of these conditionals, then it returns true
    true
  #if each conditional is met above, then returns true
    end
  end
end

def straight_flush(hand)
   "this is a straight_flush"
   suit_value = []
   face_value = []
     hand.each do |card|
       face_value << card[0]
       suit_value << card[1]
     end
    face_value = face_changer(face_value)
    face_value.sort!
    newarray = [*face_value[0]..face_value[0]+4]
     # "this is the sum of hand1 newarray#{array_sum}"
    if suit_value.uniq.length == 1
      if face_value == newarray
        true
      end
    end
end

def compare_two_straights(hand1,hand2)
  if hand1 > hand2
    true
  else
    false
  end
end


def four_of_a_kind(hand)
  face_value = cards(hand)
  face_value = face_changer(face_value)
  face_value.sort!
  if face_value.uniq.length == 2
    true
  end

end

def full_house(hand)
    face_value = cards(hand)
    if face_value.uniq.length == 2
    true
    end
end

def flush(hand)
  suit_value = cards(hand)
    if suit_value.uniq.length == 1
    true
    end
end

def straight(hand)
  suit_value = []
  face_value = []
    hand.each do |card|
      face_value << card[0]
      suit_value << card[1]
    end
    face_value = face_changer(face_value)
    face_value.sort!
    newarray = [*face_value[0]..face_value[0]+4]
    if face_value == newarray
      true
    end
end

def three_of_a_kind(hand)
face_value = cards(hand)
    if face_value.uniq.length == 3
      true
    end
end

def two_pair(hand)
  face_value = cards(hand)
    if face_value.uniq.length == 3
      true
    end
end

def pair(hand)
  suit_value = []
  face_value = []
    hand.each do |card|
      face_value << card[0]
      suit_value << card[1]
    end
    if face_value.uniq.length == 4
      true
    end
end

def high_card(hand)
  suit_value = []
  face_value = []
    hand.each do |card|
      face_value << card[0]
      suit_value << card[1]
    end
    face_value = face_changer(face_value)
    face_value.sort!
    true
end
