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

def handcomparison(hands)
  # hands = hand_builder()
  p hands
  hands.each do |key,value|
    if royal_flush(value) == true
      hands[key] = 100
    elsif straight_flush(value) == true
      hands[key] = 90
    elsif fourofakind(value) == true
      hands[key] = 80
    elsif straight(value) == true
      hands[key] = 70
    elsif threeofakind(value) == true
      hands[key] = 60
    elsif twopair(value) == true
      hands[key] = 50
    elsif fullhouse(value) == true
      hands[key] = 40
    elsif flush(value) == true
      hands[key] = 30
    elsif pair(value) == true
      hands[key] = 20
    else high_card(value) == true
      hands[key] = 10
    end
  end

  if hands["hand1"] > hands["hand2"]
    "hand1 is the winner"
  elsif hands["hand1"] < hands["hand2"]
   "hand2 is the winner"
  else
    "tie"
  end
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
  suitvalue = []
  facevalue = []
  hand.each do |card|
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
