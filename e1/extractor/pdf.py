from os.path import isfile
import pypdf
from typing import List, Optional
import os
import glob

def parse_locations(dirpath: str) -> Optional[List[str]]:
    if os.path.isdir(dirpath):
        query: str = os.path.join(dirpath, "/**/", "*.pdf")
        return glob.glob(query, recursive = True)

def parse_pdf(path: str):
    ## This should include all the metadata from the path directory,
    ## as this information remains important for the Retrieval Augmented Generation
    if os.path.isfile(path) and path.endswith(".pdf"):
