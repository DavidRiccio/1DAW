from cards import Deck
from roles import Dealer


class Game:
    def __init__(self, players):
        self.players = players
        self.deck = Deck()
        self.dealer = Dealer(players)


def get_winner(players, common_cards, private_cards):
    dealer = Dealer(players)
    return dealer.get_winner(players, common_cards, private_cards)
