{% set vim_pkg = pillar["vim"]|d("vim-nox") %}
{% set vim_bin = "/usr/bin/" + vim_pkg|replace("-", ".") %}
vim:
  pkg.installed:
    - name: {{ vim_pkg }}

vim_alternatives:
  cmd.wait:
    - names:
      - update-alternatives --set editor {{ vim_bin }}
      - update-alternatives --set vim {{ vim_bin }}
      - update-alternatives --set vimdiff {{ vim_bin }}
    - require:
      - pkg: {{ vim_pkg }}
    - watch:
      - pkg: {{ vim_pkg }}
