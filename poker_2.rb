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

def facechanger(facevalue)
  facevalue = facevalue.map do |i|
    if i == "A"
      14
    elsif i == "K"
      13
    elsif i == "Q"
      12
    elsif i == "J"
      11
    elsif i == "T"
      10
    else
      i.to_i
    end
  end
  facevalue
end

# def face_value_sum(hands)
#   suitvalue = []
#   facevalue = []
#   hand.each do |card|
#     facevalue << card[0]
#     suitvalue << card[1]
#   end
#   facevalue = facechanger(facevalue)
#   hands = [hand1].sum
# end


def handcomparison(hands)
starter_hands = hands.clone
  p hands
  p starter_hands
  starter_hands.each do |key,value|
    p "this is hands only #{hands}"
    if royal_flush(value) == true
      starter_hands[key] = 100
    elsif straight_flush(value) == true
      starter_hands[key] = 90
    elsif fourofakind(value) == true
      starter_hands[key] = 80
    elsif straight(value) == true
      starter_hands[key] = 70
    elsif threeofakind(value) == true
      starter_hands[key] = 60
    elsif twopair(value) == true
      starter_hands[key] = 50
    elsif fullhouse(value) == true
      starter_hands[key] = 40
    elsif flush(value) == true
      starter_hands[key] = 30
    elsif pair(value) == true
    starter_hands[key] = 20
    else high_card(value) == true
      starter_hands[key] = 10
    end
    p hands
    p starter_hands
  end
  if starter_hands["hand1"] > starter_hands["hand2"]
    starter_hands["hand1"] = true
  elsif starter_hands["hand1"] < starter_hands["hand2"]
    starter_hands["hand2"] = false
  else starter_hands["hand1"] == starter_hands["hand2"]
      look_at_tie(hands["hand1"],hands["hand2"])
  end
end

def tie_breaker(hand1,hand2)
  suitvalue = []
  facevalue = []
  array_sum1 = []
  array_sum2 = []
  result = ""
   "this is hand1 #{hand1}"
  hand1.each do |card|
     "this is each card #{card}"
    facevalue << card[0]
    suitvalue << card[1]
  end
    facevalue = facechanger(facevalue)
    facevalue.sort!
    newarray1 = [*facevalue[0]..facevalue[0]+4]
    array_sum1 = newarray1.sum

  suitvalue = []
  facevalue = []
  hand2.each do |card|
    facevalue << card[0]
    suitvalue << card[1]
  end
    facevalue = facechanger(facevalue)
    facevalue.sort!
    newarray2 = [*facevalue[0]..facevalue[0]+4]
    array_sum2 = newarray2.sum
    if array_sum1 > array_sum2
      result = "hand1"
    else
      result = "hand2"
    end
    result

end
def royal_flush(hand)
  suitvalue = []
  facevalue = []
  hand.each do |card|
     facevalue << card[0]#index postion
     suitvalue << card[1]
  end
  if suitvalue.uniq.length == 1
    if facevalue.include?("A") && facevalue.include?("K") && facevalue.include?("Q") && facevalue.include?("J") && facevalue.include?("T")
=begin nested if statement checks to see if duplicatets,then the length of suitvalue duplicates? returns only the unique elements. if there's only one, then all matched
and if facevalue includes the faces
=end
      true
    end
  end
end

def straight_flush(hand)
  "this is straight flush"
  suitvalue = []
  facevalue = []
  hand.each do |card|
    "this is each card #{card}"
    facevalue << card[0]
    suitvalue << card[1]
  end
  facevalue = facechanger(facevalue)
  facevalue.sort!
  newarray = [*facevalue[0]..facevalue[0]+4]
  if suitvalue.uniq.length == 1
    if facevalue == newarray
      true
    end
  end


end
def comparestraight(hand1,hand2)
  if hand1 > hand2
    true
  else false
  end
end

def fourofakind(hand)
  suitvalue = []
  facevalue = []
  hand.each do |card|
    facevalue << card[0]#index postion
    suitvalue << card[1]
  end
  facevalue = facechanger(facevalue)
  facevalue.sort!
  if facevalue.uniq.length == 2
    true
  end

end

def threeofakind(hand)
  suitvalue = []
  facevalue = []
  hand.each do |card|
    facevalue << card[0]#index postion
    suitvalue << card[1]
  end
  facevalue = facechanger(facevalue)
  facevalue.sort!
  if facevalue.uniq.length == 3
    true
  end

end

def pair(hand)
 suitvalue = []
 facevalue = []
 hand.each do |card|
    facevalue << card[0]#index postion
    suitvalue << card[1]
      end
      if facevalue.uniq.length == 4
        true
      end
end
def straight(hand)
  suitvalue = []
  facevalue = []
  hand.each do |card|
    facevalue << card[0]
    suitvalue << card[1]
  end
  facevalue = facechanger(facevalue)
  facevalue.sort!
  newarray = [*facevalue[0]..facevalue[0]+4]
  if facevalue == newarray
    true
  end
end


 def fullhouse(hand)
   suitvalue = []
   facevalue = []
   hand.each do |card|
      facevalue << card[0]#index postion
      suitvalue << card[1]
   end
   if facevalue.uniq.length == 2
     true
   end
 end
 def flush(hand)
   suitvalue = []
   facevalue = []
   hand.each do |card|
      facevalue << card[0]#index postion
      suitvalue << card[1]
   end
   if suitvalue.uniq.length == 1
     true
   end
 end



 def twopair(hand)
   suitvalue = []
   facevalue = []
   hand.each do |card|
      facevalue << card[0]#index postion
      suitvalue << card[1]
   end
   if facevalue.uniq.length == 3
     true
   end
 end


 def look_at_tie(hand1,hand2)
   # p "hand1 is #{hand1} and hand2 is #{hand2}"
 	array_of_faces = []
 	arr_of_faces2 = []
 	# single_element = []
 	result = ""
 	# counter = 0
 	match_card1 = 0
 	match_card2 = 0
 	hand1.each do |card|
    # p hand1
 		hand1_separator = card.split(//)
 		faces_to_integers = hand1_separator[0].to_i
 		# counter += 1
 		array_of_faces << faces_to_integers
 	end
 	sorted_hand1 = array_of_faces.sort
  hand1_dupes = sorted_hand1.join().match('(.)\1')[0]
 	hand1_duplicate_strings = hand1_dupes.split(//)
  hand1_singledigit = hand1_duplicate_strings[0].to_i

 	p hand1_duplicate_strings
  p sorted_hand1

 	hand2.each do |card|
    # p hand2
     	hand2_separator = card.split(//)
     	faces_to_int2 = hand2_separator[0].to_i
 		# counter += 1
 		arr_of_faces2 << faces_to_int2
 	end
 	sorted_hand2 = arr_of_faces2.sort
 	hand2_dupes = sorted_hand2.join().match('(.)\1')[0]
 	hand2_duplicate_strings = hand2_dupes.split(//)
  hand2_singledigit = hand2_duplicate_strings[0].to_i

  p hand2_singledigit
 	p hand2_duplicate_strings
  p sorted_hand2
  
  if hand1_singledigit > hand2_singledigit
 		result = "hand1 wins"
 	else
 		result = "hand2 wins"
 	end
 end

# def kicker_card(hand,match_card)
#     new_hand = hand.delete(match_card)
#     highh_num = hand.last
# end
#
# def eval_tie(hand1,hand2)
#     hand1match = deal_with_tie(hand1)
#     hand2match = deal_with_tie(hand2)
#     if hand1match == hand2match
#       kicker_card1 = kicker_card(hand1)
#       kicker_card2 = kicker_card(hand2)
#       if kicker_card1 > kicker_card2
#         "hand1 is the winner"
#       else kicker_card2 > kicker_card1
#         "hand2 is the winner"
#     end
#   elsif hand1match > hand2match
#     "hand1 is the winner"
#   else
#     "hand2 is the winner"
#   end
# end
 def high_card(hand)
  suit_value = []
  face_value = []
    hand.each do |card|
      face_value << card[0]
      suit_value << card[1]
    end
    face_value = facechanger(face_value)
    face_value.sort!
    # newarray = [*face_value[0]..face_value[0]+4]
      # if face_value == newarray
      true
      # end
end


hands = hand_builder()
handcomparison(hands)
