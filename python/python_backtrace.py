import sys,os,threading,traceback

def dumpstacks(signal, frame):
    id2name = dict([(th.ident, th.name) for th in threading.enumerate()])
    code = []
    for threadId, stack in sys._current_frames().items():
      code.append("\n# Thread: %s(%d)" % (id2name.get(threadId,""), threadId))
      for filename, lineno, name, line in traceback.extract_stack(stack):
        code.append('File: "%s", line %d, in %s' % (filename, lineno, name))
        if line:
          code.append("  %s" % (line.strip()))
    with open("/tmp/python_backtrace_%d.txt" % os.getpid() ) as f:
      print >> f, "\n".join(code)

import signal
signal.signal(signal.SIGQUIT, dumpstacks)
