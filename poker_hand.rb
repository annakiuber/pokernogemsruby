deck = {
    "cards" => [2,3,4,5,6,7,8,9,10,"jack","queen","king","ace"],
    "diamonds" => [2,3,4,5,6,7,8,9,10,"jack","queen","king","ace"],
    "spades" => [2,3,4,5,6,7,8,9,10,"jack","queen","king","ace"],
    "clubs" => [2,3,4,5,6,7,8,9,10,"jack","queen","king","ace"]
}

def create_deck(deck)
  hand1 = deck.shuffle(deck)
  puts hand
  hand
end
p "this is my deck #{create_deck}"
