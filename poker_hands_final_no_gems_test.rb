require "minitest/autorun"
require_relative "poker_hands_final_no_gems.rb"

class Poker_hands_test < Minitest::Test
	def test_true_equals_true
		assert_equal(true,true)
	end

	def test_for_hash
		assert_equal(Hash,hand_builder().class)
	end

	# def test_for_two_hands
	# 	assert_equal(2,hand_builder().length)
	# end

	def test_for_length_of_each_hand
		hand_length1 = hand_builder()["hand1"]
		hand_length2 = hand_builder()["hand2"]
		assert_equal(5,hand_length1.length)
		assert_equal(5,hand_length2.length)
	end

	def test_for_duplications
		hand1 = hand_builder()["hand1"]
		hand2 = hand_builder()["hand2"]
		assert_equal(hand1,hand1.uniq)
		assert_equal(hand2,hand2.uniq)
	end

	def test_face_changer
		face_value = []
		assert_equal(Array,face_changer(face_value).class)
	end

	def test_face_A_to_14
		hand1 = ["A", "3", "2", "5", "7"]
		changed_hand = [14, 3, 2, 5, 7]
		assert_equal(changed_hand,face_changer(hand1))
	end

	def test_face_all_letters
		hand1 = ["A", "K", "Q", "J", "T"]
		changed_hand = [14, 13, 12, 11, 10]
		assert_equal(changed_hand,face_changer(hand1))
	end

	def test_for_royal_flush_hash_class
		hand = ["Ad", "Kd", "Qd", "Jd", "Td"]
		assert_equal(TrueClass, royal_flush(hand).class)
	end

	def test_valid_royal_flush
		hand = ["Ad", "Kd", "Qd", "Jd", "Td"]
		assert_equal(true,royal_flush(hand))
	end

	def test_invalid_royal_flush
		hand = ["As", "Kd", "Qd", "Jd", "Td"]
		assert_nil(royal_flush(hand))
	end

	def test_for_straight_flush_hash_class
		hand = ["8d", "6d", "7d", "5d", "9d"]
		assert_equal(TrueClass,straight_flush(hand).class)
	end

	def test_valid_straight_flush
		hand = ["8d", "6d", "7d", "5d", "9d"]
		assert_equal(true,straight_flush(hand))
	end

	def test_invalid_straight_flush
		hand = ["2d", "6d", "7d", "5d", "9d"]
		assert_nil(straight_flush(hand))
	end

	def test_four_of_a_kind_hash_class
		hand = ["8d", "8s", "8c", "8h", "9d"]
		assert_equal(TrueClass,four_of_a_kind(hand).class)
	end

	def test_valid_four_of_a_kind
		hand = ["8d", "8s", "8c", "8h", "9d"]
		assert_equal(true,four_of_a_kind(hand))
	end

	def test_valid_four_of_a_kind
		hand = ["7d", "8s", "8c", "8h", "9d"]
		assert_nil(four_of_a_kind(hand))
	end

	def test_three_of_a_kind_hash_class
		hand = ["7d", "8s", "8c", "8h", "9d"]
		assert_equal(TrueClass,three_of_a_kind(hand).class)
	end

	def test_valid_three_of_a_kind_hash
		hand = ["7d", "8s", "8c", "8h", "9d"]
		assert_equal(true,three_of_a_kind(hand))
	end

	def test_invalid_three_of_a_kind_hash
		hand = ["7d", "2s", "8c", "8h", "9d"]
		assert_nil(three_of_a_kind(hand))
	end

	def test_pair_hash_class
		hand = ["7d", "2s", "8c", "8h", "9d"]
		assert_equal(TrueClass,pair(hand).class)
	end

	def test_valid_pair
		hand = ["7d", "2s", "8c", "8h", "9d"]
		assert_equal(true,pair(hand))
	end

	def test_invalid_pair
		hand = ["7d", "2s", "3c", "8h", "9d"]
		assert_nil(pair(hand))
	end

	# def test_full_house_hash_class
	# 	hand = ["7d", "7s", "7c", "8h", "8d"]
	# 	assert_equal(TrueClass,full_house(hand).class)
	# end

	# def test_valid_full_house_hash
	# 	hand = ["7d", "7s", "7c", "8h", "8d"]
	# 	assert_equal(true,full_house(hand))
	# end

	def test_valid_full_house
		hand = ["9d", "7s", "7c", "8h", "8d"]
		assert_nil(full_house(hand))
	end

	# def test_flush_class
	# 	hand = ["7d", "8d", "6d", "4d", "5d"]
	# 	assert_equal(TrueClass,flush(hand).class)
	# end

	# def test_valid_flush
	# 	hand = ["7d", "8d", "6d", "4d", "5d"]
	# 	assert_equal(true,flush(hand))
	# end

	def test_invalid_flush
		hand = ["7s", "8d", "6d", "4d", "5d"]
		assert_nil(flush(hand))
	end

	def test_straight_class
		hand = ["7", "8d", "6d", "4d", "5d"]
		assert_equal(TrueClass,straight(hand).class)
	end

	def test_valid_straight
		hand = ["7d", "8d", "6d", "4d", "5d"]
		assert_equal(true,straight(hand))
	end

	def test_invalid_straight
		hand = ["2d", "8d", "6d", "4d", "5d"]
		assert_nil(straight(hand))
	end

	def test_two_pair_class
		hand = ["7h", "7d", "6d", "6s", "5d"]
		assert_equal(TrueClass,two_pair(hand).class)
	end

	def test_valid_two_pair
		hand = ["7h", "7d", "6d", "6s", "5d"]
		assert_equal(true,two_pair(hand))
	end

	def test_invalid_two_pair
		hand = ["7h", "7d", "3d", "6s", "5d"]
		assert_nil(two_pair(hand))
	end

	def test_high_card_class
		hand = ["7h", "3d", "4d", "6s", "5d"]
		assert_equal(TrueClass,high_card(hand).class)
	end

	def test_valid_high_card
		hand = ["7h", "3d", "4d", "6s", "5d"]
		assert_equal(true,high_card(hand))
	end

	def test_invalid_high_card
		hand = ["3h", "3c", "3d", "3s", "2d"]
		assert_equal(true,high_card(hand))
	end

	def test_hand_comparison_class
		hands = {"hand1" => ["7h", "3d", "4d", "6s", "5h"], "hand2" => ["9h", "3d", "4d", "6s", "5h"]}
		assert_equal(String,hand_comparison(hands).class)
	end

	# def test_hand_comparison_straight
	# 	hand1 = ["7h", "3d", "4d", "6s", "5h"]
	# 	hand2 = ["9h", "3d", "4d", "6s", "5h"]
	# 	hands = {"hand1" => hand1, "hand2" => hand2}
	# 	assert_equal("hand1 is the winner",hand_comparison(hands))
	# end

	# def test_hand_comparison_royal_flush_beats_a_straight
	# 	hand1 = ["Qh", "Kh", "Jh", "Th", "Ah"]
	# 	hand2 = ["7h", "3h", "4h", "6h", "5h"]
	# 	hands = {"hand1" => hand1, "hand2" => hand2}
	# 	assert_equal("hand1 is the winner",hand_comparison(hands))
	# end

	def test_hand_comparison_straight_flush_beats_a_three_of_a_kind
		hand1 = ["2h", "2s", "2c", "Th", "Ah"]
		hand2 = ["7h", "3h", "4h", "6h", "5h"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("starter hand2 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_full_house_beats_a_flush
		hand1 = ["5h", "5c", "5d", "2s", "2d"]
		hand2 = ["6h", "3h", "8h", "9h", "4"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("starter hand1 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_flush_beats_straight
		hand1 = ["6h", "5c", "3d", "2s", "4d"]
		hand2 = ["6h", "3h", "8h", "9h", "4h"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("starter hand1 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_four_of_a_kind_beats_a_pair
		hand1 = ["2h", "2s", "2c", "2d", "Ah"]
		hand2 = ["7h", "7c", "4h", "6h", "5h"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("starter hand1 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_three_of_a_kind_beats_a_pair
		hand1 = ["2h", "2s", "2c", "7d", "Ah"]
		p "this is hand1 #{hand1}"
		hand2 = ["7h", "7c", "4h", "6h", "5h"]
		p "this is hand2 #{hand2}"
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("starter hand1 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_two_pair_beats_a_pair
		hand1 = ["2h", "2s", "3c", "7d", "Ah"]
		hand2 = ["7h", "7c", "4h", "4c", "5h"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("starter hand2 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_a_pair_beats_high_card
		hand1 = ["2h", "2s", "3c", "7d", "Ah"]
		hand2 = ["Th", "7c", "3h", "4c", "5h"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("starter hand1 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_high_card_wins
		hand1 = ["2h", "9s", "3c", "7d", "Ah"]
		hand2 = ["Th", "7c", "3h", "2c", "4h"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("hand1 is the winner",hand_comparison(hands))
	end

	# def test_comparing_two_straight_flush_is_true
	# 	assert_equal(true,compare_two_straights(4,3))
	# end

	# def test_comparing_two_straight_flush_is_true
	# 	assert_equal(false,compare_two_straights(3,4))
	# end

	# def test_hand_comparison_of_two_straight_flush
	# 	hand1 = ["2h", "3h", "4h", "5h", "6h"]
	# 	hand2 = ["3h", "4h", "5h", "6h", "7h"]
	# 	hands = {"hand1" => hand1, "hand2" => hand2}
	# 	assert_equal("hand2",hand_comparison(hands))
	# end

	# def test_tie_breaker_of_two_straights
	# 	hand1 = ["3h", "4h", "5h", "6h", "7h"]
	# 	hand2 = ["2h", "3h", "4h", "5h", "6h"]
	# 	hands = {"hand1" => hand1, "hand2" => hand2}
	# 	assert_equal("hand1 is the winner",tie_breaker(hand1,hand2))
	# end

	def test_deal_with_tie_one_pair
		hand1 = ["7h", "7d", "4h", "6h", "5h"]
		hand2 = ["3h", "3d", "5h", "6d", "7h"]
	 	assert_equal("hand1 is the winner",deal_with_tie(hand1,hand2))
	end

	def test_deal_with_tie_three_of_a_kind
		hand1 = ["4s", "4d", "4h", "6h", "5h"]
		hand2 = ["3h", "7s", "5h", "7d", "7h"]
	 	assert_equal("hand2 is the winner",deal_with_tie(hand1,hand2))
	end

	def test_deal_with_tie_four_of_a_kind
		hand1 = ["5s", "5d", "5h", "5c", "3h"]
		hand2 = ["2h", "7s", "7c", "7d", "7h"]
	 	assert_equal("hand2 is the winner",deal_with_tie(hand1,hand2))
	end

	def test_deal_with_tie_one_pair_tie_same_paired_numbers
		hand1 = ["7h", "7d", "4h", "6h", "9h"]
		hand2 = ["7c", "7s", "5h", "6d", "2h"]
		hands = {"hand1" => hand1, "hand2" => hand2}
	 	assert_equal("hand1 is the winner",deal_with_tie(hand1,hand2))
	end

	def test_deal_with_tie_one_pair_tie_kicker_card_tie
		hand1 = ["7h", "7d", "4h", "6h", "9h"]
		hand2 = ["7c", "7s", "5h", "3d", "9h"]
		hands = {"hand1" => hand1, "hand2" => hand2}
	 	assert_equal("hand1 is the winner",deal_with_tie(hand1,hand2))
	end

	def test_hand_comparison_three_of_a_kind_tie
		hand1 = ["4s", "4d", "4h", "6h", "5h"]
		hand2 = ["3h", "7s", "5h", "7d", "7h"]
		hands = {"hand1" => hand1, "hand2" => hand2}
	 	assert_equal("hand2 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_four_of_a_kind_tie
		hand1 = ["5s", "5d", "5h", "5c", "3h"]
		hand2 = ["2h", "7s", "7c", "7d", "7h"]
		hands = {"hand1" => hand1, "hand2" => hand2}
	 	assert_equal("hand2 is the winner",hand_comparison(hands))
	end

	def test_deal_with_tie_using_royal_four_of_a_kind
		hand1 = ["Qh", "Qd", "Qc", "Qs", "6h"]
		hand2 = ["3h", "Ts", "Th", "Td", "Tc"]
		hands = {"hand1" => hand1, "hand2" => hand2}
	 	assert_equal("hand1 is the winner",deal_with_tie(hand1,hand2))
	end

	def test_deal_with_tie_using_royal_three_of_a_kind
		hand1 = ["2h", "Qd", "Qc", "Qs", "6h"]
		hand2 = ["3h", "Js", "Kh", "Kd", "Kc"]
		# hands = {"hand1" => hand1, "hand2" => hand2}
	 	assert_equal("hand2 is the winner",deal_with_tie(hand1,hand2))
	end

	def test_deal_with_tie_using_royal_pair
		hand1 = ["2h", "Jd", "Jc", "Qs", "6h"]
		hand2 = ["3h", "Js", "Th", "Td", "Kc"]
		# hands = {"hand1" => hand1, "hand2" => hand2}
	 	assert_equal("hand1 is the winner",deal_with_tie(hand1,hand2))
	end

	def test_hand_comparison_using_royal_pair
		hand1 = ["2h", "4d", "Jc", "Js", "3h"]
		hand2 = ["3h", "4s", "Th", "Td", "2c"]
		hands = {"hand1" => hand1, "hand2" => hand2}
	 	assert_equal("hand1 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_using_royal_three_of_a_kind
		hand1 = ["2h", "Qd", "Qc", "Qs", "4h"]
		hand2 = ["3h", "Ks", "Kh", "Kd", "4c"]
		hands = {"hand1" => hand1, "hand2" => hand2}
	 	assert_equal("hand2 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_using_royal_four_of_a_kind
		hand1 = ["Qh", "Qd", "Qc", "Qs", "6h"]
		hand2 = ["3h", "Ts", "Th", "Td", "Tc"]
		hands = {"hand1" => hand1, "hand2" => hand2}
	 	assert_equal("hand1 is the winner",hand_comparison(hands))
	end

	def test_deal_with_tie_full_house_tie
		hand1 = ["5h", "5c", "5d", "2s", "2d"]
		hand2 = ["4h", "4c", "4d", "2s", "2d"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("hand1 is the winner",deal_with_tie(hand1,hand2))
	end

	def test_deal_with_tie_two_pair_tie
		hand1 = ["5h", "5c", "3d", "2s", "2d"]
		hand2 = ["7h", "4c", "4d", "2s", "2d"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("hand1 is the winner",deal_with_tie(hand1,hand2))
	end

	def test_hand_comparison_full_house_tie
		hand1 = ["5h", "5c", "5d", "2s", "2d"]
		hand2 = ["4h", "4c", "4d", "2s", "2d"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("hand1 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_two_pair_tie
		hand1 = ["5h", "5c", "3d", "2s", "2d"]
		hand2 = ["7h", "4c", "4d", "2s", "2d"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("hand1 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_royal_full_house_tie
		hand1 = ["Qh", "Qc", "Qd", "2s", "2d"]
		hand2 = ["Jh", "Jc", "Jd", "2s", "2d"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("hand1 is the winner",hand_comparison(hands))
	end

	def test_hand_comparison_royal_two_pair_tie
		hand1 = ["Qh", "Qc", "3d", "2s", "2d"]
		hand2 = ["Jh", "Jc", "5d", "2s", "2d"]
		hands = {"hand1" => hand1, "hand2" => hand2}
		assert_equal("hand1 is the winner",hand_comparison(hands))
	end
	def test_flush_winner_hand_one_wins
		hand1 = ["2d", "9d", "3d", "6d","8d"]
		hand2 = ["Js", "Jd", "Jc", "8h","Ts"]
		hands = {"hand1" => hand1,"hand2" => hand2}
		assert_equal("hand1 is the winner",hand_comparison(hands))
	end

end
