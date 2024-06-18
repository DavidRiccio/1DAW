from cards import Card, Deck, Hand
from roles import Dealer, Player


class Game:
    def __init__(self, players):
        self.players = players
        self.dealer = Dealer()
        self.deck = Deck()

    def deal_initial_cards(self):
        self.deck.shuffle()
        for player in self.players:
            player.private_cards = self.deck.draw(2)

    def deal_common_cards(self):
        self.common_cards = self.deck.draw(5)
        self.dealer.deal_common_cards(self.common_cards)
        return self.common_cards


def get_winner(
    players: list[Player], common_cards: list[Card], private_cards: list[list[Card]]
) -> tuple[Player | None, Hand]:
    combined_cards = [common_cards + private for private in private_cards]
    player_hands = [Hand(cards) for cards in combined_cards]

    best_hand = max(player_hands)
    if player_hands.count(best_hand) > 1:
        return None, best_hand
    winner_index = player_hands.index(best_hand)

    return players[winner_index], best_hand
