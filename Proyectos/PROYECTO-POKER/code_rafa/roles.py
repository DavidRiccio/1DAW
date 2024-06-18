class Player:
    def __init__(self, name):
        self.name = name
        self.private_cards = []


class Dealer:
    def __init__(self):
        self.common_cards = []

    def deal_common_cards(self, cards):
        self.common_cards = cards
