# *************************
# BUSCANDO PALABRAS COMUNES
# *************************
import filecmp
from pathlib import Path


def run(input_path: Path) -> bool:
    output_path = 'data/common_words/output.txt'
    with open(input_path,'r') as f:
        lines=[sentence.lower().strip().split() for sentence in f]
        
    with open(output_path,'w') as f2:
        for line1 in lines:
            for line2 in lines:
                common_words=set(line1) & set(line2)
                f2.write(f'{len(common_words)}\n')


    return filecmp.cmp(output_path, 'data/common_words/.expected', shallow=False)


if __name__ == '__main__':
    run('data/common_words/minizen.txt')   