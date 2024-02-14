import math
from utils.builder import build
from utils.controller import test

build()

test_data = []

# Research 1
for i in range(1, 25):
    x = 10**i
    test_data.append({"pi": math.pi, "points": [(0, x), (0, 0), (x, 0)]})

for i in range(1, 25):
    x = 10**(-i)
    test_data.append({"pi": math.pi, "points": [(0, x), (0, 0), (x, 0)]})

test('Reasearch 1', test_data)

test_data = []
for i in range(0, 55, 4):
    x = 10**(4-i)
    test_data.append({"pi": math.pi, "points": [(0, 10**4), (0, 0), (x, 0)]})

for i in range(0, 59, 4):
    x = 10**(8-i)
    test_data.append({"pi": math.pi, "points": [(0, 10**8), (0, 0), (x, 0)]})

test('Reasearch 2', test_data)

# Research 3
test_data = []

for i in range(1, 10):
    test_data.append({"pi": round(math.pi, i), "points": [(0, 4), (0, 0), (4, 0)]})

test('Reasearch 3', test_data)