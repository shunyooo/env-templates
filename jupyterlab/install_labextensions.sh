pip install --upgrade pip

# ipywidgets
pip install ipywidgets
jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build 

# ipyvolume
jupyter labextension install ipyvolume --no-build

# jupyterlab-git
pip install --upgrade jupyterlab-git

# collapsible_headings
jupyter labextension install @aquirdturtle/collapsible_headings --no-build

# jupyterlab_code_formatter
pip install black isort
pip install jupyterlab_code_formatter
jupyter labextension install @ryantam626/jupyterlab_code_formatter --no-build
jupyter serverextension enable --py jupyterlab_code_formatter

# jupyterlab-system-monitor
pip install nbresuse==0.4.0
jupyter labextension install jupyterlab-topbar-extension jupyterlab-system-monitor --no-build

# jupyterlab_templates
pip install jupyterlab_templates
jupyter labextension install jupyterlab_templates --no-build
jupyter serverextension enable --py jupyterlab_templates 

# toc
jupyter labextension install @jupyterlab/toc --no-build 

# jupyterlab_go_to_definition
jupyter labextension install @krassowski/jupyterlab_go_to_definition --no-build 

# plotly
jupyter labextension install jupyterlab-plotly@4.14.3 --no-build 
jupyter labextension install @jupyter-widgets/jupyterlab-manager plotlywidget@4.14.3 --no-build 

# Build
jupyter lab build --minimize False
