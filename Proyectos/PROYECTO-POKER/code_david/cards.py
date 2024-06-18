from __future__ import annotations


class Card:
    LETTERS = {
        "J": 11,
        "Q": 12,
        "K": 13,
        "A": 14,
    }

    def __init__(self, card_string):
        self.value = card_string[:-1]
        self.suit = card_string[-1]
        self.card_value = (
            self.LETTERS[self.value] if self.value in self.LETTERS else int(self.value)
        )

    def __gt__(self, other: Card):
        return self.card_value > other.card_value

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, Card):
            return NotImplemented
        return self.card_value == other.card_value

    def __repr__(self):
        return f"Card('{self.value}{self.suit}')"

    def __str__(self):
        return self.value


class Deck:
    def __init__(self):
        self.cards = [
            Card(f"{value}{suit}")
            for value in Card.LETTERS.keys()
            for suit in Card.suits_order.keys()
        ]
        self.shuffle()

    def __len__(self):
        return len(self.cards)

    def __repr__(self):
        return ", ".join(str(card) for card in self.cards)


class Hand:
    HIGH_CARD = 0
    ONE_PAIR = 1
    TWO_PAIR = 2
    THREE_OF_A_KIND = 3
    STRAIGHT = 4
    FLUSH = 5
    FULL_HOUSE = 6
    FOUR_OF_A_KIND = 7
    STRAIGHT_FLUSH = 8

    def __init__(self, cards: list[Card]):
        self.cards = cards
        self.cards = self.sort_values()
        self.cat, self.cat_rank = self.evaluate()

    def __repr__(self):
        return f"{self.cards}"

    def __iter__(self):
        for card in self.cards:
            yield card

    def __getitem__(self, index: int):
        return self.cards[index]

    def __gt__(self, other: Hand):
        if self.cat == other.cat:
            value1 = self[0].card_value
            value2 = other[0].card_value
            return value1 > value2
        return self.cat > other.cat

    def __eq__(self, other: object) -> bool:
        if isinstance(other, Hand):
            return self.cat == other.cat
        if isinstance(other, int):
            return self.cat == other
        return NotImplemented

    def sort_values(self):
        values = {}
        for card in self.cards:
            if card.card_value in values:
                values[card.card_value] += 1
            else:
                values[card.card_value] = 1
        return sorted(
            self.cards, key=lambda card: (values[card.card_value], card.card_value), reverse=True
        )

    def evaluate(self):
        if self.is_straight_flush():
            self.cat = Hand.STRAIGHT_FLUSH
            self.cat_rank = self.is_high_card()
            return self.cat, self.cat_rank
        if self.is_full_house():
            self.cat = Hand.FULL_HOUSE
            self.cat_rank = self.is_high_card(), self.cards[3].value
            return self.cat, self.cat_rank
        if self.is_flush():
            self.cat = Hand.FLUSH
            self.cat_rank = self.is_high_card()
            return self.cat, self.cat_rank
        if self.is_straight():
            self.cat = Hand.STRAIGHT
            self.cat_rank = self.is_high_card()
            return self.cat, self.cat_rank
        if self.is_four_of_a_kind():
            self.cat = Hand.FOUR_OF_A_KIND
            self.cat_rank = self.is_high_card()
            return self.cat, self.cat_rank
        if self.is_three_of_a_kind():
            self.cat = Hand.THREE_OF_A_KIND
            self.cat_rank = self.is_high_card()
            return self.cat, self.cat_rank
        if self.is_two_pair():
            self.cat = Hand.TWO_PAIR
            self.cat_rank = self.is_high_card(), self.cards[2].value
            return self.cat, self.cat_rank
        if self.is_one_pair():
            self.cat = Hand.ONE_PAIR
            self.cat_rank = self.is_high_card()
            return self.cat, self.cat_rank
        return Hand.HIGH_CARD, self.is_high_card()

    def is_high_card(self):
        return self[0].value

    def is_one_pair(self):
        return self.cards[0] == self.cards[1]

    def is_two_pair(self):
        return self[0] == self[1] and self[2] == self[3]

    def is_three_of_a_kind(self):
        return self[0] == self[1] and self[1] == self[2]

    def is_four_of_a_kind(self):
        return self[0] == self[1] and self[1] == self[2] and self[2] == self[3]

    def is_straight(self):
        values = [int(card.card_value) for card in self]
        buffer = values[0]
        for value in values[1:]:
            if buffer - 1 != value:
                return False
            buffer = value
        return True

    def is_straight_flush(self):
        return self.is_straight() and self.is_flush()

    def is_full_house(self):
        return self[0] == self[1] and self[1] == self[2] and self[3] == self[4]

    def is_flush(self):
        return len(set(card.suit for card in self.cards)) == 1

    def __contains__(self, card: Card):
        return card in self.cards
