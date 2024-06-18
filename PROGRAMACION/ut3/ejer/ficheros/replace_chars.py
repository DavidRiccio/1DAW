# ***********************
# REEMPLAZO DE CARACTERES
# ***********************
import filecmp
from pathlib import Path


def run(input_path: Path, replacements: str) -> bool:
    output_path = 'data/replace_chars/r_noticia.txt'
    replace_letters=replacements.split('|')
    lines=[]
    
    with open(input_path) as f:
        for line in f:
            for old_char,new_char in replace_letters:
                line=line.replace(old_char,new_char)
            lines.append(line)
            
    with open(output_path,'w') as f2:
        f2.writelines(lines)

   
    return filecmp.cmp(output_path, 'data/replace_chars/.expected', shallow=False)


if __name__ == '__main__':
    run('data/replace_chars/noticia.txt', 'áa|ée|íi|óo|úu')