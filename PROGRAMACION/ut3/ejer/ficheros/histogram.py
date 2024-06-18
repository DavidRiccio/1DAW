# **********
# HISTOGRAMA
# **********
import filecmp
from pathlib import Path


def run(data_path: Path) -> bool:
    counter = {}

    with open(data_path) as f:
        data=f.read().strip()

    for d in data:
        counter[d] = counter.get(d, 0) + 1

    histogram_path = 'data/histogram/histogram.txt'
    with open(histogram_path,'w') as f2:
        for letter in sorted(counter):
            count=counter[letter]
            bar = '█' * count
            f2.write(f'{letter} {bar} {count}\n')

 
    return filecmp.cmp(histogram_path, 'data/histogram/.expected', shallow=False)


if __name__ == '__main__':
    run('data/histogram/data.txt')