# *********************************
# SEPARANDO MAYÚSCULAS Y MINÚSCULAS
# *********************************


def split_case(words:list)->tuple:
    lower_words=[]
    upper_words=[]
    for word in words:
        if word.upper()==word:
            upper_words.append(word)
        else:
            if word.lower()==word:
                lower_words.append(word)
    return lower_words, upper_words


    

