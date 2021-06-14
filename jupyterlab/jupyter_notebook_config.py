import multiprocessing

import psutil

c.ServerApp.token = ''
c.ServerApp.terminado_settings = { 'shell_command': ['/bin/bash'] }

c.JupyterLabTemplates.template_dirs = ['list', 'of', 'template', 'directories']
c.JupyterLabTemplates.include_default = True
c.JupyterLabTemplates.include_core_paths = True

# memory
mem = psutil.virtual_memory() 
c.ResourceUseDisplay.mem_limit = mem.total

# cpu
c.ResourceUseDisplay.track_cpu_percent = True
c.ResourceUseDisplay.cpu_limit = multiprocessing.cpu_count()
