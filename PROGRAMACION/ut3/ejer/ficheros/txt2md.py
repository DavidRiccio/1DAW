# *******************
# DE TEXTO A MARKDOWN
# *******************
import filecmp
from pathlib import Path


def run(text_path: Path) -> bool:
    md_path = 'data/txt2md/outline.md'
    f=open(text_path,'r')
    f2=open(md_path,'w')
    for line in f:
        indent_count = line.count('\t') + 1
        depth = '#' * indent_count
        f2.write(f'{depth} {line.lstrip()}')
    f2.close()
    f.close()
    return filecmp.cmp(md_path, 'data/txt2md/.expected', shallow=False)


if __name__ == '__main__':
    run('data/txt2md/outline.txt')
     