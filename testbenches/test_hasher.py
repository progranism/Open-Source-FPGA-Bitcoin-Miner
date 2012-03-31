k = [0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,\
   0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,\
   0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,\
   0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,\
   0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,\
   0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,\
   0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,\
   0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2]


def idx(x, y):
	return (x >> (y * 32)) & 0xFFFFFFFF

def ror(x, y):
	return (x >> y) | ((x << (32 - y)) & 0xFFFFFFFF)

def round(a, b, c, d, e, f, g, h, data, k):
	w14 = idx(data, 14)
	w9 = idx(data, 9)
	w1 = idx(data, 1)
	w0 = idx(data, 0)
	s0 = ror(w1, 7) ^ ror(w1, 18) ^ (w1 >> 3)
	s1 = ror(w14, 17) ^ ror(w14, 19) ^ (w14 >> 10)
	w16 = (w0 + s0 + s1 + w9) & 0xFFFFFFFF

	data = (data >> 32) | (w16 << 480)

	e0 = ror(a, 2) ^ ror(a, 13) ^ ror(a, 22)
	e1 = ror(e, 6) ^ ror(e, 11) ^ ror(e, 25)
	maj = (a & b) ^ (a & c) ^ (b & c)
	ch = (e & f) ^ ((~e) & g)

	t2 = (e0 + maj) & 0xFFFFFFFF
	t1 = (h + e1 + ch + k + w0) & 0xFFFFFFFF

	h = g
        g = f
        f = e
        e = (d + t1) & 0xFFFFFFFF
        d = c
        c = b
        b = a
        a = (t1 + t2) & 0xFFFFFFFF
	
	return (a, b, c, d, e, f, g, h, data)

def hash(state, data):
	a = idx(state, 0)
	b = idx(state, 1)
	c = idx(state, 2)
	d = idx(state, 3)
	e = idx(state, 4)
	f = idx(state, 5)
	g = idx(state, 6)
	h = idx(state, 7)

	for i in range(64):
		(a, b, c, d, e, f, g, h, data) = round(a, b, c, d, e, f, g, h, data, k[i])

		print "\t[%d]\t\t%08x%08x%08x%08x%08x%08x%08x%08x" % (i, h, g, f, e, d, c, b, a)
	
	a = (a + idx(state, 0)) & 0xFFFFFFFF
	b = (b + idx(state, 1)) & 0xFFFFFFFF
	c = (c + idx(state, 2)) & 0xFFFFFFFF
	d = (d + idx(state, 3)) & 0xFFFFFFFF
	e = (e + idx(state, 4)) & 0xFFFFFFFF
	f = (f + idx(state, 5)) & 0xFFFFFFFF
	g = (g + idx(state, 6)) & 0xFFFFFFFF
	h = (h + idx(state, 7)) & 0xFFFFFFFF
	
	return (h << 224) | (g << 192) | (f << 160) | (e << 128) | (d << 96) | (c << 64) | (b << 32) | a


midstate = 0x228ea4732a3c9ba860c009cda7252b9161a5e75ec8c582a5f106abb3af41f790
data = 0x0000028000000000000000000000000000000000000000000000000000000000000000000000000000000000800000000e33337a2194261a9395e64dbed17115

hash1 = hash(midstate, data)
print "-------------------------------------------------------------------------"
print "%32X" % hash1
print "-------------------------------------------------------------------------"
hash2 = hash(0x5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667, (0x0000010000000000000000000000000000000000000000000000000080000000 << 256) | hash1)

