import subprocess
import openpyxl
import os

DIST_DIR = "researches"

INPUT = "1"
EXIT = "5"

OPTIONS = {
    2: "S",
    3: "fi",
    4: "cosfi"
}

def points_to_text(points):
    return "\n".join(f"{x} {y}" for x, y in points)

def execute(pi, points):
    result = {}
    result["Pi"] = str(pi)
    result["A"] = str(points[0])
    result["B"] = str(points[1])
    result["C"] = str(points[2])
    for i in range(2, 5):
        process = subprocess.Popen(['./main'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        commands = [str(pi), INPUT, points_to_text(points), str(i), EXIT]
        text = "\n".join(commands) + "\n"
        output, error = process.communicate(text.encode())
        result[OPTIONS[i]]=output.decode().split('\n')[10].strip()

    return result

def save(filename, title, data):
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = title

    header = list(data[0].keys())
    ws.append(header)

    for item in data:
        ws.append(list(item.values()))

    if (not os.path.exists(DIST_DIR)):
        os.makedirs(DIST_DIR)

    wb.save(DIST_DIR + "/" + filename + ".xlsx")

def test(name, test_data):
    data = []
    for test_item in test_data:
        data.append(execute(test_item["pi"], test_item["points"]))

    save(name, name, data)