import random
import sys

def card_Num(x):
    num = (x // 4)+2
    return num


def card_Suit(x):
    suit = x % 4
    if suit == 0:
        return 'clubs'
    if suit == 1:
        return 'diamonds'
    if suit == 2:
        return 'hearts'
    if suit == 3:
        return 'spades'

def card_Label(x):
    N = card_Num(x)
    S = card_Suit(x)
    if N <=10:
        num = N
        result = print(str(num) + ' of ' + str(S))
    if N == 11:
        num = 'Jack'
        result = print(str(num) + ' of ' + str(S))
    if N == 12:
        num = 'Queen'
        result = print(str(num) + ' of ' + str(S))
    if N == 13:
        num = 'King'
        result = print(str(num) + ' of ' + str(S))
    if N == 14:
        num = 'Ace'
        result = print(str(num) + ' of ' + str(S))

    return result

def play_Game():
    deck_ranks = list(range(0, 52))
    shuffled_deck_ranks = random.sample(deck_ranks, 52)

    pc = [shuffled_deck_ranks[i] for i in range(len(shuffled_deck_ranks)) if i % 2 != 0]
    user = [shuffled_deck_ranks[i] for i in range(len(shuffled_deck_ranks)) if i % 2 == 0]

    S_pc = 0
    S_user = 0
    print("Score: ", S_pc, "-", S_user, "\n")
    for i in range(26):
        print("Welcome to Round ", i + 1, ":")
        hit_Command = input("Type 'Hit' and press enter to draw the cards:\n")
        if hit_Command=="Hit":
            card_Label(pc[i])
            card_Label(user[i])
            if pc[i] > user[i]:
                S_pc = S_pc + 1
            else:
                S_user = S_user + 1
            print("Score: ", S_pc, "-", S_user, "\n")
        else:
            print("Error: Please type 'Hit' and rerun the program to play the round")
            sys.exit()

    if S_pc > S_user:
        print("Sorry, you lost!")
    elif S_pc < S_user:
        print("Wow! you won!")
    elif S_pc == S_user:
        print("It's a tie")

print("Welcome to Pacifist War!")
z = input("Type 'Start' and click enter to begin the game:\n")
if z=='Start':
    play_Game()
else:
    print("Error: Please rerun the program and follow the instructions")
    sys.exit()

