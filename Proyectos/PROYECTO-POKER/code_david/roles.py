from cards import Card, Hand
from helpers import combinations


class Player:
    def __init__(self, name):
        self.name = name
        self.private_cards = []
        self.common_cards = []

    def receive_private_cards(self, cards: list[Card]):
        self.private_cards = cards

    def receive_common_cards(self, cards: list[Card]):
        self.common_cards = cards

    def best_hand(self):
        total_cards = self.private_cards + self.common_cards
        best_hand = None
        for hand in combinations(total_cards, n=5):
            hand = Hand(list(hand))
            if not best_hand or hand > best_hand:
                best_hand = hand
            elif best_hand == hand:
                for card1, card2 in zip(best_hand, hand):
                    if card1 < card2:
                        best_hand = hand
                    elif card1 > card2:
                        break
        return best_hand


class Dealer:
    def __init__(self, players):
        self.player1, self.player2 = players

    def deal_common_cards(self, common_cards):
        self.player1.receive_common_cards(common_cards)
        self.player2.receive_common_cards(common_cards)

    def deal_private_cards(self, cards):
        self.player1.receive_private_cards(cards[0])
        self.player2.receive_private_cards(cards[1])

    def get_winner(
        self, players: list[Player], common_cards: list[Card], private_cards: list[list[Card]]
    ) -> tuple[Player | None, Hand]:
        player1, player2 = players
        self.deal_common_cards(common_cards)
        self.deal_private_cards(private_cards)
        best_hand = player1.best_hand(), player2.best_hand()
        best_hand1, best_hand2 = best_hand

        if all(card1 == card2 for card1, card2 in zip(best_hand1, best_hand2)):
            return None, best_hand1
        if best_hand1 > best_hand2:
            return player1, best_hand1
        elif best_hand2 > best_hand1:
            return player2, best_hand2
        else:
            for card1, card2 in zip(best_hand1, best_hand2):
                if card1 > card2:
                    return player1, best_hand1
                if card1 < card2:
                    return player2, best_hand2
            return None, best_hand1
