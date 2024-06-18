# *******************
# TEMPERATURAS MEDIAS
# *******************
import filecmp
from pathlib import Path


def run(input_path: Path) -> bool:
    output_path = 'data/avg_temps/avg_temps.dat'
    avg_temp=[]
    with open(input_path) as f:
        for line in f:
            temps=[int(num) for num in line.strip().split(',')]
            avg=sum(temps)/len(temps)
            avg_temp.append(avg)
            
    with open(output_path, 'w') as f2:
        for avg_temp in avg_temp:
            f2.write(f'{avg_temp:.2f}\n')
    


    return filecmp.cmp(output_path, 'data/avg_temps/.expected', shallow=False)


if __name__ == '__main__':
    run('data/avg_temps/temperatures.dat')