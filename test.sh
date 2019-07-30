#!/bin/sh

GDB_PYTHON=`echo 'py import sys ; print(sys.executable)' | gdb -q | egrep '\(gdb\) /' | cut -d' ' -f2`

[ -n "${GDB_PYTHON}" ] || {
    echo "incorrect GDB_PYTHON" >&2
    exit 1
}

#python -m pip install setuptools --user

git clone https://github.com/msaf1980/gdbprint || exit 1
cd gdbprint || exit 1
${GDB_PYTHON} setup.py install --user || exit 1
cd ..
rm -rf gdbprint

${GDB_PYTHON} setup.py test || exit 1
${GDB_PYTHON} setup.py install --user || exit 1
${GDB_PYTHON} setup.py bdist || exit 1
