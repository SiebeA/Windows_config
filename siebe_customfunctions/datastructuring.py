# datastructing means manipulating the actual structure 'around the data' for enhanced convenience but does not affect the data itself 

def keys_to_dataframe_by1stLetter(keys):
    """
    input: list of keys

    This function takes a LIST of keys and returns a DF with the first letter of each key under COLUMN[A-Z] to which the first letter of the key corresponds

    returns a dataframe
    """
    import pandas as pd
    
    # create a dictionary with the letters a to z as keys
    letter_dict = {chr(i): [] for i in range(97, 123)}
    
    # add every letter to the dictionary as a value to the key that corresponds to the first letter of the company name
    for key in keys:
        try:
         letter_dict[key[0]].append(key)
        except KeyError:
            pass
        
    # convert the dictionary to a dataframe with nan for empty values
    df = pd.DataFrame.from_dict(letter_dict, orient='index').T
    
    return df


def foo(bar):
    """
    input: bar

    This function does something

    returns: something
    """
    pass
