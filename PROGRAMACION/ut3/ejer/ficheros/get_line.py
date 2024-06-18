# *****************
# HAN CANTADO LÍNEA
# *****************
from pathlib import Path


def run(input_path: Path, line_no: int) -> str:
   line=None
   with open(input_path,'r') as f:
    lines=f.readlines()
    if line_no <=0 or line_no>=len(lines):
       line=None
    else:
       line=lines[line_no - 1].strip()

       

    return line


if __name__ == '__main__':
    run('data/get_line/nasdaq.txt', 20)