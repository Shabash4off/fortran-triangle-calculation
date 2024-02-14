import subprocess


def build():
    subprocess.check_call(['gfortran', '--std=legacy', '--fpe-summary=none', '-o', 'main', 'main.for'])  # для Fortran
