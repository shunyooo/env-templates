import psutil
import multiprocessing

c.NotebookApp.token = ''
c.NotebookApp.terminado_settings = { 'shell_command': ['/bin/bash'] }

c.JupyterLabTemplates.template_dirs = ['list', 'of', 'template', 'directories']
c.JupyterLabTemplates.include_default = True
c.JupyterLabTemplates.include_core_paths = True

# memory
mem = psutil.virtual_memory() 
c.NotebookApp.ResourceUseDisplay.mem_limit = mem.total

# cpu
c.NotebookApp.ResourceUseDisplay.track_cpu_percent = True
c.NotebookApp.ResourceUseDisplay.cpu_limit = multiprocessing.cpu_count()

# for @krassowski/jupyterlab-lsp
# https://jupyterlab-lsp.readthedocs.io/en/latest/Configuring.html
# c.LanguageServerManager.language_servers = {
#     "python": {
#         "argv": ["python", "-m", "pyls"],
#         "languages": ["python"],
#         "version": 2
#     }
# }
