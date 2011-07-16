#!/usr/bin/env python

# by teknohog

# Python wrapper for Xilinx Serial Miner

user = "teknohog.spartan"
password = "nexys2"
host = "api2.bitcoin.cz"
http_port = "8332"

serial_port = "/dev/ttyS0"

askrate = 5

###############################################################################

from jsonrpc import ServiceProxy
from time import ctime, sleep, time
from serial import Serial
from threading import Thread, Event
from Queue import Queue

def stats(count, starttime):
    # 2**32 hashes per share (difficulty 1)
    mhshare = 4294.967296

    s = sum(count)
    tdelta = time() - starttime
    rate = s * mhshare / tdelta

    # This is only a rough estimate of the true hash rate,
    # particularly when the number of events is low. However, since
    # the events follow a Poisson distribution, we can estimate the
    # standard deviation (sqrt(n) for n events). Thus we get some idea
    # on how rough an estimate this is.

    # s should always be positive when this function is called, but
    # checking for robustness anyway
    if s > 0:
        stddev = rate / s**0.5
    else:
        stddev = 0

    return "[%i accepted, %i failed, %.2f +/- %.2f Mhash/s]" % (count[0], count[1], rate, stddev)

class Reader(Thread):
    def __init__(self):
        Thread.__init__(self)

        self.daemon = True

        # flush the input buffer
        ser.read(1000)

    def run(self):
        while True:
            nonce = ser.read(4)

            if len(nonce) == 4:
                # Keep this order, because writer.block will be
                # updated due to the golden event.
                submitter = Submitter(writer.block, nonce)
                submitter.start()
                golden.set()


class Writer(Thread):
    def __init__(self):
        Thread.__init__(self)

        # Keep something sensible available while waiting for the
        # first getwork
        self.block = "0" * 256
        self.midstate = "0" * 64

        self.daemon = True

    def run(self):
        while True:
            try:
                work = bitcoin.getwork()
                self.block = work['data']
                self.midstate = work['midstate']
            except:
                print("RPC getwork error")
                # In this case, keep crunching with the old data. It will get 
                # stale at some point, but it's better than doing nothing.

            # Just a reminder of how Python slices work in reverse
            #rdata = self.block.decode('hex')[::-1]
            #rdata2 = rdata[32:64]
            rdata2 = self.block.decode('hex')[95:63:-1]

            rmid = self.midstate.decode('hex')[::-1]
            
            payload = rmid + rdata2
            
            ser.write(payload)
            
            result = golden.wait(askrate)

            if result:
                golden.clear()

class Submitter(Thread):
    def __init__(self, block, nonce):
        Thread.__init__(self)

        self.block = block
        self.nonce = nonce

    def run(self):
        # This thread will be created upon every submit, as they may
        # come in sooner than the submits finish.

        print("Block found on " + ctime())

        # debug, compare to the 7-segment display
        print(self.nonce.encode('hex'))

        hrnonce = self.nonce[::-1].encode('hex')

        data = self.block[:152] + hrnonce + self.block[160:]

        try:
            result = bitcoin.getwork(data)
            print("Upstream result: " + str(result))
        except:
            print("RPC send error")
            # a sensible boolean for stats
            result = False

        results_queue.put(result)

class Display_stats(Thread):
    def __init__(self):
        Thread.__init__(self)

        self.count = [0, 0]
        self.starttime = time()
        self.daemon = True

        print("Miner started on " + ctime())

    def run(self):
        while True:
            result = results_queue.get()
            
            if result:
                self.count[0] += 1
            else:
                self.count[1] += 1
                
            print(stats(self.count, self.starttime))
                
            results_queue.task_done()

golden = Event()

url = 'http://' + user + ':' + password + '@' + host + ':' + http_port

bitcoin = ServiceProxy(url)

results_queue = Queue()

ser = Serial(serial_port, 115200, timeout=askrate)

reader = Reader()
writer = Writer()
disp = Display_stats()

reader.start()
writer.start()
disp.start()

try:
    while True:
        # Threads are generally hard to interrupt. So they are left
        # running as daemons, and we do something simple here that can
        # be easily terminated to bring down the entire script.
        sleep(10000)
except KeyboardInterrupt:
    print("Terminated")

