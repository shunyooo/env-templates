# -- パスの追加 --
# import os
# import sys
# path = os.path.join(os.path.abspath(os.curdir), '../src')
# sys.path.append(path)

# -- matplotlib --
import matplotlib as mpl
mpl.rcParams['figure.figsize'] = [20.0, 10.0]

# -- pandas --
import pandas as pd
pd.set_option("display.max_colwidth", 500)
pd.set_option("display.max_rows", 101)
import matplotlib.pyplot as plt
plt.style.use('ggplot')

# -- ipython notebook  --
from IPython import get_ipython
ipython = get_ipython()

# Determine if this is running in Jupyter notebook or not
if ipython:
    running_in_notebook = ipython.has_trait('kernel')
    if running_in_notebook:
        ipython.magic('reload_ext autoreload')
        ipython.magic('autoreload 2')
        ipython.magic('matplotlib inline')
else:
    # cannot even get ipython object...
    running_in_notebook = False
