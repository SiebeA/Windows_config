import argparse
import os
import re

def main(extension):
    """
    Replace spaces in filenames with underscores for a given extension.
    """
    for file in os.listdir():
        # extension = extension
        if extension:
            if file.endswith(extension) and re.search(' ', file):
                new_name = file.replace(' ', '_')
                # replace multiple underscores with one
                new_name = re.sub('_+', '_', new_name)
                os.rename(file, new_name)
        else:
            if re.search(' ', file):
                new_name = file.replace(' ', '_')
                # replace multiple underscores with one
                new_name = re.sub('_+', '_', new_name)
                os.rename(file, new_name)
                print(new_name)

if __name__ == '__main__':
    # Create an ArgumentParser object
    parser = argparse.ArgumentParser()

    # Add an argument to the parser
    parser.add_argument('--extension', required=False, help='The file extension to process')

    # Parse the command-line arguments
    args = parser.parse_args()

    # Call the main function with the parsed extension argument
    main(extension=args.extension)
