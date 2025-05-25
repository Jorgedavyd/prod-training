from io import BytesIO
import numpy as np

class ImageExtractor(object):
    @staticmethod
    async def __call__(img: BytesIO, query: str) -> str:
        raise NotImplementedError

def interpret_from_image(img: np.Array):
    query: str = """
        You are a prof...
        """
    return ImageExtractor(img, query)

def describe_from_image(img: np.Array):
    query: str = """
        You are a prof...
        """
    return ImageExtractor(BytesIO(img), query)
