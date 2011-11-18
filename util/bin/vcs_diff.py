from sys import stdin
from StringIO import StringIO
import subprocess as sub
from termcolor import COLORS, RESET

def green(mesg):
    return _color(mesg, 32)

def red(mesg):
    return _color(mesg, 31)

def cyan(mesg):
    return _color(mesg, 36)

def yellow(mesg):
    return _color(mesg, 33)

def _color(mesg, code):
    return "\33[{0}m{1}".format(code, mesg) + RESET

def diff_output(file_data):
    lines = file_data.split("\n")
    print yellow(lines[0])
    print yellow(lines[1])
    for line in lines[2:]:
        line = line.strip()
        if line == '':
            continue
        elif line[0] == "-":
            print red(line)
        elif line[0] == "+":
            print green(line)
        elif line[:2] == '@@':
            print cyan("\n"+line)
        else:
            print line

def main(opts):
    out_buf = StringIO()
    p = sub.Popen(opts['cmd'], shell=True, stdout=sub.PIPE)
    output, errors = p.communicate()

    files = output.split(opts['splitter'])
    if len(files) < 2:
        return
    print "Total Files Changed: {0}".format(len(files)-1)
    s = raw_input('')
    x = 0
    while x < len(files):
        s
        x += 1
        if x == len(files):
            return
        p = sub.Popen('clear', shell=True)
        p.communicate()
        diff_output(files[x])
        path = files[x].split("\n")[0].replace('Index: ', '')
        s = raw_input(("\n\n\n\n\n\nFile {0} of {1} -  "\
                      + "Continue? [ (p)rev / (r)estore / (e)dit ]   -  ")\
                      .format(x, len(files)-1))
        if s == 'p':
            # Previous file
            x -= 2
            if x < 0:
                x = 0

        if s == 'r':
            # Revert file ... confirm first
            confirm = raw_input("Are you sure you want to restore this file? "\
                                "(yes/no): ")
            if confirm == 'yes':
                cmd = opts['restore'].format(path)
                print cmd
                sub.Popen(cmd, shell=True).communicate()
                raw_input("\n\n[Press any key to continue]")
            else:
                x -= 1

        if s == 'e':
            # Edit file
            sub.Popen('vim {0}'.format(path),
                shell=True).communicate()
            raw_input("\n\n[Press any key to continue]")
            files[x], errors = sub.Popen("svn diff {0}".format(path),
                                         shell=True,
                                         stdout=sub.PIPE).communicate()
            x -= 1

if __name__ == "__main__":
    main()


