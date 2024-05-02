import os
import numpy as np
import pandas as pd

def convert():
    files = os.listdir("../data/subjects_xy/")
    return files

def main():
    pass

if __name__ == "__main__":
    files = convert()