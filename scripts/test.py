import math
from utils.builder import build
from utils.controller import test

build()

test_data = [
    {"pi": math.pi, "points": [(10, 0), (0, 0), (0, 10)]},
    {"pi": math.pi, "points": [(10, 0), (0, 0), (5, 5 * math.sqrt(3))]},
    {"pi": math.pi, "points": [(0, 0), (0, 1), (math.sqrt(3), 0)]},
    {"pi": math.pi, "points": [(0, 0), (0, 0), (0, 0)]},
    {"pi": math.pi, "points": [(0, 0), (0, 0), (0, 10)]},
    {"pi": math.pi, "points": [(1, 1), (2, 2), (100, 100)]},
]

test('Test', test_data)