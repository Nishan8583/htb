# -*- coding: utf-8 -*-
import crypt,sys

if len(sys.argv) < 3:
    print("python crack.py <hash-file>, <password-file>")
    sys.exit(-1)

pf = open(sys.argv[1])
hf = open(sys.argv[2])

hashes = hf.read().split("\n")
hf.close()
print(hashes)

i = 0
for p in pf.readlines():
    p = p.rstrip()
    h = crypt.crypt(p,"$1$🧂llol$")
    sys.stdout.write("\rTrying Password {} {}".format(i,p))
    sys.stdout.flush()
    i = i + 1
    for hash1 in hashes:
        if hash1 == h:
            print("\n")
            print("HASH FOUND {} {}".format(p,hash1))
            print("\n")
            sys.stdout.flush()

