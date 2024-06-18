# ********************
# LA PALABRA MÁS LARGA
# ********************
from pathlib import Path


def run(input_path: Path) -> str:
   STRIP_CHARS = '.,:;()'
   max_length=0
   longest_word=''
   with open(input_path) as f:
    for line in f:
       words=line.strip().split()
       clean_words=[clean.strip(STRIP_CHARS) for clean in words]
       for word in clean_words:
          if len(word)>=max_length:
             max_length=len(word)
             longest_word=word
          

    return longest_word


if __name__ == '__main__':
    run('data/longest_word/python.txt')