
import os
import re

def main(extension):
    """
    Replace spaces in filenames with underscores for a given extension.
    """
    for file in os.listdir():
        # if file.endswith('.txt'): and filename contains a space
        extension = extension
        if file.endswith(extension) and re.search(' ', file):
            new_name = file.replace(' ', '_')
            # replace multiple underscores with one
            new_name = re.sub('_+', '_', new_name)
            os.rename(file, new_name)

if __name__ == '__main__':
    main()