from __future__ import annotations

import helpers


class Card:
    values_order = {
        "2": 0,
        "3": 1,
        "4": 2,
        "5": 3,
        "6": 4,
        "7": 5,
        "8": 6,
        "9": 7,
        "10": 8,
        "J": 9,
        "Q": 10,
        "K": 11,
        "A": 12,
    }
    suits_order = {"♠": 0, "♣": 0, "◆": 0, "❤": 0}
    """ pendiente de cambiarlo, porque el valor 'corazón' puede ganar siempre """

    def __init__(self, card_string):
        self.value = card_string[:-1]
        self.suit = card_string[-1]

    def __gt__(self, other: Card):
        return Card.values_order[self.value] > Card.values_order[other.value]

    def __lt__(self, other: Card):
        return Card.values_order[self.value] < Card.values_order[other.value]

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, Card):
            return NotImplemented
        return self.value == other.value and self.suit == other.suit

    def __repr__(self):
        return f"Card('{self.value}{self.suit}')"


class Deck:
    def __init__(self):
        self.cards = [
            Card(f"{value}{suit}")
            for value in Card.values_order.keys()
            for suit in Card.suits_order.keys()
        ]
        self.shuffle()

    def shuffle(self):
        helpers.shuffle(self.cards)

    def draw(self, num_cards=1):
        drawn_cards = []
        for _ in range(num_cards):
            drawn_cards.append(self.cards.pop())
        return drawn_cards

    def __len__(self):
        return len(self.cards)

    def __repr__(self):
        return ", ".join(str(card) for card in self.cards)


class Hand:
    HIGH_CARD = "High Card"
    ONE_PAIR = "One Pair"
    TWO_PAIR = "Two Pair"
    THREE_OF_A_KIND = "Three of a Kind"
    STRAIGHT = "Straight"
    FLUSH = "Flush"
    FULL_HOUSE = "Full House"
    FOUR_OF_A_KIND = "Four of a Kind"
    STRAIGHT_FLUSH = "Straight Flush"

    hand_rankings = {
        HIGH_CARD: 0,
        ONE_PAIR: 1,
        TWO_PAIR: 2,
        THREE_OF_A_KIND: 3,
        STRAIGHT: 4,
        FLUSH: 5,
        FULL_HOUSE: 6,
        FOUR_OF_A_KIND: 7,
        STRAIGHT_FLUSH: 8,
    }

    def __init__(self, cards: list[Card]):
        self.cards = sorted(
            cards,
            key=lambda card: (
                Card.values_order[card.value],
                Card.suits_order[card.suit],
            ),
        )
        self.cat, self.cat_rank = self.evaluate()

    def __contains__(self, card):
        return card in self.cards

    def __gt__(self, other: Hand):
        if Hand.hand_rankings[self.cat] != Hand.hand_rankings[other.cat]:
            return Hand.hand_rankings[self.cat] > Hand.hand_rankings[other.cat]
        if self.cat_rank != other.cat_rank:
            return self.compare_ranks(self.cat_rank, other.cat_rank)
        return self.compare_high_cards(self.cards, other.cards)

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, Hand):
            return NotImplemented
        return (
            self.cat == other.cat
            and self.cat_rank == other.cat_rank
            and self.cards == other.cards
        )

    def __lt__(self, other: Hand):
        if Hand.hand_rankings[self.cat] != Hand.hand_rankings[other.cat]:
            return Hand.hand_rankings[self.cat] < Hand.hand_rankings[other.cat]
        if self.cat_rank != other.cat_rank:
            return not self.compare_ranks(self.cat_rank, other.cat_rank)
        return not self.compare_high_cards(self.cards, other.cards)

    def __repr__(self):
        return f"Hand({self.cat}, {self.cat_rank})"

    def __iter__(self):
        self._index = 0
        return self

    def __next__(self):
        if self._index < len(self.cards):
            card = self.cards[self._index]
            self._index += 1
            return card
        else:
            raise StopIteration

    def evaluate(self):
        if self.is_straight_flush():
            return Hand.STRAIGHT_FLUSH, self.get_rank_straight_flush()
        elif self.is_four_of_a_kind():
            return Hand.FOUR_OF_A_KIND, self.get_rank_four_of_a_kind()
        elif self.is_full_house():
            return Hand.FULL_HOUSE, self.get_rank_full_house()
        elif self.is_flush():
            return Hand.FLUSH, self.get_rank_flush()
        elif self.is_straight():
            return Hand.STRAIGHT, self.get_rank_straight()
        elif self.is_three_of_a_kind():
            return Hand.THREE_OF_A_KIND, self.get_rank_three_of_a_kind()
        elif self.is_two_pair():
            return Hand.TWO_PAIR, self.get_rank_two_pair()
        elif self.is_one_pair():
            return Hand.ONE_PAIR, self.get_rank_one_pair()
        else:
            return Hand.HIGH_CARD, self.get_rank_high_card()

    def is_straight_flush(self):
        return self.is_straight() and self.is_flush()

    def get_rank_straight_flush(self):
        if self.is_straight_flush():
            return max(self.cards, key=lambda card: Card.values_order[card.value]).value
        return None

    def is_four_of_a_kind(self):
        value_counts = self.get_value_counts()
        return any(count == 4 for count in value_counts.values())

    def get_rank_four_of_a_kind(self):
        value_counts = self.get_value_counts()
        for value, count in value_counts.items():
            if count == 4:
                return value
        return None

    def is_full_house(self):
        value_counts = self.get_value_counts()
        return 3 in value_counts.values() and 2 in value_counts.values()

    def get_rank_full_house(self):
        value_counts = self.get_value_counts()
        three_of_a_kind = max(
            value for value, count in value_counts.items() if count == 3
        )
        pair = max(value for value, count in value_counts.items() if count == 2)
        return three_of_a_kind, pair

    def is_flush(self):
        suit_counts = {}
        for card in self.cards:
            suit_counts[card.suit] = suit_counts.get(card.suit, 0) + 1
        return any(count >= 5 for count in suit_counts.values())

    def get_rank_flush(self):
        if self.is_flush():
            flush_suit = max(
                set(card.suit for card in self.cards),
                key=lambda suit: sum(card.suit == suit for card in self.cards),
            )
            flush_cards = [card for card in self.cards if card.suit == flush_suit]
            return max(
                flush_cards, key=lambda card: Card.values_order[card.value]
            ).value
        return None

    def is_straight(self):
        values = [Card.values_order[card.value] for card in self.cards]
        unique_values = sorted(set(values))
        for i in range(len(unique_values) - 4):
            if unique_values[i : i + 5] == list(
                range(unique_values[i], unique_values[i] + 5)
            ):
                return True
        if set([0, 1, 2, 3, 12]).issubset(unique_values):
            return True

        return False

    def get_rank_straight(self):
        values = [Card.values_order[card.value] for card in self.cards]
        unique_values = sorted(set(values))
        for i in range(len(unique_values) - 4):
            if unique_values[i : i + 5] == list(
                range(unique_values[i], unique_values[i] + 5)
            ):
                return list(Card.values_order.keys())[unique_values[i + 4]]
        if set([0, 1, 2, 3, 12]).issubset(unique_values):
            return "5"

        return None

    def is_three_of_a_kind(self):
        value_counts = self.get_value_counts()
        return any(count == 3 for count in value_counts.values())

    def get_rank_three_of_a_kind(self):
        value_counts = self.get_value_counts()
        for value, count in value_counts.items():
            if count == 3:
                return value
        return None

    def is_two_pair(self):
        value_counts = self.get_value_counts()
        return len([value for value, count in value_counts.items() if count == 2]) == 2

    def get_rank_two_pair(self):
        value_counts = self.get_value_counts()
        pairs = sorted(
            [value for value, count in value_counts.items() if count == 2],
            key=lambda v: Card.values_order[v],
        )
        return pairs[-1], pairs[-2]

    def is_one_pair(self):
        value_counts = self.get_value_counts()
        return any(count == 2 for count in value_counts.values())

    def get_rank_one_pair(self):
        value_counts = self.get_value_counts()
        for value, count in value_counts.items():
            if count == 2:
                return value
        return None

    def get_rank_high_card(self):
        return max(self.cards, key=lambda card: Card.values_order[card.value]).value

    def get_value_counts(self):
        value_counts = {}
        for card in self.cards:
            value_counts[card.value] = value_counts.get(card.value, 0) + 1
        return value_counts

    def compare_ranks(self, rank1, rank2):
        if isinstance(rank1, tuple) and isinstance(rank2, tuple):
            for r1, r2 in zip(rank1, rank2):
                if Card.values_order[r1] != Card.values_order[r2]:
                    return Card.values_order[r1] > Card.values_order[r2]
            return False
        return Card.values_order[rank1] > Card.values_order[rank2]

    def compare_high_cards(self, cards1, cards2):
        sorted_cards1 = sorted(
            cards1,
            key=lambda card: (
                Card.values_order[card.value],
                Card.suits_order[card.suit],
            ),
            reverse=True,
        )
        sorted_cards2 = sorted(
            cards2,
            key=lambda card: (
                Card.values_order[card.value],
                Card.suits_order[card.suit],
            ),
            reverse=True,
        )

        for card1, card2 in zip(sorted_cards1, sorted_cards2):
            if card1 != card2:
                return card1 > card2
        return False
