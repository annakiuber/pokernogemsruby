require "minitest/autorun"
require_relative "poker_2.rb"

class Addition_test < Minitest::Test

	def test_boulean
	 	assert_equal(true, true)
	end

	def test_hands_equal
		assert_equal(Hash, hand_builder().class)
	end

	def test_for_one_hand
		assert_equal(2, hand_builder().length)
	end

	def test_for_length_of_hand1hand2
		handlength1 = hand_builder()["hand1"] #I set variable equal to handlength so assertion wpuldn't be long
		handlength2 = hand_builder()["hand2"]
		assert_equal(5,handlength1.length)
		assert_equal(5,handlength2.length)
	end

	def test_for_duplicates
		hand1 = hand_builder()["hand1"]
		hand2 = hand_builder()["hand2"]
		assert_equal(hand1,hand1.uniq)
		assert_equal(hand2,hand2.uniq)
	end

	def test_royal_equal_hash
		hand = ["Ad","Kd","Qd","Jd","Td"]
		assert_equal(TrueClass, royal_flush(hand).class)
	end
#
	def test_valid_royal_flush
		hand = ["Ad","Kd","Qd","Jd","Td"]
		assert_equal(true, royal_flush(hand))
	end
	def test_valid_royal_flush_flase
		hand = ["As","Kd","Qd","Jd","Td"]
		assert_nil(royal_flush(hand))
	end

	def test_straight_flush_equal_class
		hand = ["Ts","9s","8s","7s","6s"]
		assert_equal(TrueClass, straight_flush(hand).class)
	end

	def test_straight_flush_ten_high
		hand = ["Ts","9s","8s","6s","7s"]
		assert_equal(true, straight_flush(hand))
	end

	def test_invalid_straight_flush
		hand = ["Ts","9s","8s","6d","7s"]
		assert_nil(straight_flush(hand))
	end
	def test_for_four_of_a_kind_class
		hand = ["8d","8s","8h","8c","6s"]
		assert_equal(TrueClass, fourofakind(hand).class)
	end
	def test_for_four_of_a_kind
		hand = ["8d","8s","8h","8c","6s"]
		assert_equal(true, fourofakind(hand))
	end
	def test_valid_fourofakind
		hand = ["Ts","9s","8s","6s","7d"]
		assert_nil(fourofakind(hand))
	end
#
# 	def test_for_class_face_changer
# 		facevalue = []
# 		assert_equal(Array,facechanger(facevalue).class)
# 	end
#
# 	def  test_A_is_14
# 		hand = ["A","9","8","7","7"]
# 		changedhand = [14,9,8,7,7]
# 		assert_equal(changedhand, facechanger(hand))
# 	end
#
# 	def test_letter_face_changed_to_number
# 		hand = ["A","Q","T","K","J"]
# 		changedhand = [14,12,10,13,11]
# 		assert_equal(changedhand, facechanger(hand))
# 	end
	def test_for_class_threeofakind
		hand = ["2s", "2d", "2c", "6h", "7h"]
		assert_equal(TrueClass, threeofakind(hand).class)
	end
	def test_for_three_of_a_kind
		hand = ["8d","8h","8s","6c ","7s"]
	 assert_equal(true, threeofakind(hand))
 end
 def test_valid_threeofakind
	 hand = ["Ts","9s","8s","6s","7d"]
	 assert_nil(threeofakind(hand))
 end
 def test_for_class_pair
	 hand = ["2s", "2d", "3c", "6h", "7h"]
	 assert_equal(TrueClass, pair(hand).class)
 end
 def test_for_pair
	hand = ["2s", "2d", "3c", "6h", "7h"]
	assert_equal(true, pair(hand))
end
def test_valid_pair
	hand = ["2s", "4d", "3c", "6h", "7h"]
	assert_nil(pair(hand))
end

def test_for_class_fullhouse
	hand = ["10s","10d","10c","9h","9s"]
	assert_equal(TrueClass, fullhouse(hand).class)
end
def test_for_fullhouse
 hand = ["10s","10d","10c","9h","9s"]
 assert_equal(true, fullhouse(hand))
end
def test_valid_fullhouse
	hand = ["10s","10d","8c","9h","9s"]
	assert_nil(fullhouse(hand))
end

def test_for_class_flush
	hand = ["2d", "3d", "4d", "5d", "6d"]
	assert_equal(TrueClass, flush(hand).class)
end
def test_for_flush
	hand = ["Td","9d","8d","7d","6d"]
 assert_equal(true, flush(hand))
end
def test_valid_flush
	hand = ["10s","10d","8c","9h","9s"]
	assert_nil(flush(hand))
end
def test_for_class_straight
	hand = ["9s", "8d", "7c", "6h", "5h"]
	assert_equal(TrueClass, straight(hand).class)
end
def test_for_straight
	hand = ["9s", "8d", "7c", "6h", "5h"]
 	assert_equal(true, straight(hand))
end
def test_valid_straight
	hand = ["10s","10d","8c","9h","9s"]
	assert_nil(straight(hand))
end
def test_for_class_twopair
	hand = ["8s", "8d", "7c", "7h", "5h"]
	assert_equal(TrueClass, twopair(hand).class)
end
def test_for_twopair
	hand = ["8s", "8d", "7c", "7h", "5h"]
  assert_equal(true, twopair(hand))
end
def test_valid_twopair
	hand = ["7h", "3d", "4d", "6s", "5h"]
	assert_nil(twopair(hand))
end
def test_for_class_high_card
	hand = ["7h", "3d", "4d", "6s", "5h"]
	assert_equal(TrueClass, high_card(hand).class)
end
def test_for_high_card
	hand = ["8s", "8d", "7c", "7h", "5h"]
  assert_equal(true, high_card(hand))
end
def test_for_class_handcomparison
	hands = {"hand1" => ["7h", "3d", "4d", "6s", "5h"],"hand2" => ["9h", "3d", "4d", "6s", "5h"]}
	assert_equal(String, handcomparison(hands).class)
end
def test_for_class_handcomparison_hands
	hand1 = ["7h", "3d", "4d", "6s", "5h"]
	hand2 = ["9h", "3d", "4d", "6s", "5h"]
	hands = {"hand1" => hand1,"hand2" => hand2}
	assert_equal("hand1 is the winner", handcomparison(hands))
end
def test_hand_comparrison_straight
	hand1 = ["7h", "3d", "4d", "6s", "5h"]
	hand2 = ["9h", "3d", "4d", "6s", "5h"]
	hands = {"hand1" => hand1,"hand2" => hand2}
	assert_equal("hand1 is the winner", handcomparison(hands))
end
def test_hand_comparrison_royal_flush_beats_straight
	hand1 = ["Qh", "Kh", "Jh", "Th", "Ah"]
	hand2 = ["7h", "3h", "4h", "6h", "5h"]
	hands = {"hand1" => hand1,"hand2" => hand2}
	assert_equal("hand1 is the winner", handcomparison(hands))
end
def test_hand_comparrison_straight_flush_beats_three_of_kind
	hand1 = ["2h", "2s", "2c", "Th", "Ah"]
	hand2 = ["7h", "3h", "4h", "6h", "5h"]
	hands = {"hand1" => hand1,"hand2" => hand2}
	assert_equal("hand2 is the winner", handcomparison(hands))
end
def test_hand_comparrison_four_of_a_kind_beats_pair
	hand1 = ["2h", "2s", "2c", "Th", "Ah"]
	hand2 = ["7h", "7c", "4h", "6h", "5h"]
	hands = {"hand1" => hand1,"hand2" => hand2}
	assert_equal("hand1 is the winner", handcomparison(hands))
end
def test_hand_comparrison_three_o_kind_beats_pair
	hand1 = ["2h", "2s", "2c", "7d", "Ah"]
	hand2 = ["7h", "7c", "4h", "6h", "5h"]
	hands = {"hand1" => hand1,"hand2" => hand2}
	assert_equal("hand1 is the winner", handcomparison(hands))
end
end
