# from typing import Literal  # -> Valid only from Python 3.8
from typing_extensions import Literal  # -> Valid from Python 3.7.9

import uvicorn
from multiprocessing import cpu_count, freeze_support

LoopTypes = Literal["none", "auto", "asyncio", "uvloop"]


def start_server(host: str = "127.0.0.1", port: int = 5000, workers: int = 4, loop: LoopTypes = "asyncio",
                 reload: bool = False):

    uvicorn.run("main:app", host=host, port=port, workers=workers, loop=loop, reload=reload)


if __name__ == "__main__":
    freeze_support()  # Needed for pyinstaller for multiprocessing on WindowsOS
    num_workers = int(cpu_count() * 0.75)
    start_server(workers=num_workers)
