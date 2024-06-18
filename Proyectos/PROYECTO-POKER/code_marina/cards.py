class Card:
    def __init__(self,value:str):
        self.value = value 
        
    def __str__(self) -> str:
        return self.value
#print(Card('7❤️'))

from helpers import shuffle
class Deck:
    def __init__(self):
        self.cards = []

    def create_deck(self):
        SUITS = ['❤️', '♦️', '♠️', '♣️']
        VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
        for suit in SUITS:
            for value in VALUES:
                self.cards.append(Card(value + suit))
    def shuffle(self):
        shuffle (self.cards)


    
class Hand:
    pass


if __name__ == '__main__':
    deck = Deck()
    deck.create_deck()

    def print_deck(deck):
        for i, cards in enumerate(deck.cards):
            if i > 0 and i % 13 == 0:
                print()
            print(cards, end='')
        print('\n')
    print('antes de mezclar: ')
    print_deck(deck)

    deck.shuffle()
    print('despues de mezclar: ')
    print_deck(deck)
