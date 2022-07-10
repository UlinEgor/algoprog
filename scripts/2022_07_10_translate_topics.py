#!/usr/bin/python3
import json
import os
import os.path
import re
import requests

INDENT2 = "    "

def translate(strings):
    data = {
        "folderId": os.environ["FOLDER_ID"],
        "texts": strings,
        "targetLanguageCode": "en",
        "sourceLanguageCode": "ru",
        "format": "HTML"
    }
    headers = {
        "Content-Type": "application/json",
        "Authorization": "Api-Key " + os.environ["API_KEY"]
    }
    url = "https://translate.api.cloud.yandex.net/translate/v2/translate"
    result = requests.post(url, json=data, headers=headers)
    return [x["text"] for x in result.json()["translations"]]

def make_ruen(ru, en, indent=None):
    if not indent:
        return 'ruen("' + ru + '", "' + en + '")'
    else:
        return 'ruen(\n' + indent + '"' + ru + '",\n' + indent + '"' + en + '")'

def replace_imports(match):
    imports = match.group(0).split("\n")
    imports = [i for i in imports if i]
    imports.append(r'import {ruen} from "../../lib/util"')
    imports = sorted(imports)
    return "\n".join(imports) + "\n"

def replace_topic(match):
    PROBLEMS_ON = "Задачи на "
    indent = match.group(1)
    head = match.group(2)
    name1 = match.group(3)
    name2 = match.group(4)
    add_problems = False
    if name2[:len(PROBLEMS_ON)] == PROBLEMS_ON:
        name2 = name2[len(PROBLEMS_ON):]
        add_problems = True
    en_name1, en_name2 = translate([name1, name2])
    if add_problems:
        en_name2 = "Problems on " + en_name2
        name2 = PROBLEMS_ON + name2
    return (indent + head + "(\n" +
        indent + INDENT2 + make_ruen(name1, en_name1) + ",\n" +
        indent + INDENT2 + make_ruen(name2, en_name2) + ",\n" +
        indent + "[")

def replace_label(match):
    indent = match.group(1)
    head = match.group(2)
    text = match.group(3)
    to_tr = json.loads("\"" + text + "\"")
    en_text = json.dumps(translate([to_tr])[0])[1:-1]
    print(text)
    print(en_text)
    return (indent + head + make_ruen(text, en_text, " " * len(indent) + INDENT2) + ")")

path = "server/materials/data/topics"
topics = [os.path.join(path, f) for f in os.listdir(path)]
topics = [f for f in topics if os.path.isfile(f)]

cnt = 0
for topic in topics:
#for topic in [path + "/2sat.coffee"]:
    print(topic)
    with open(topic, "r") as f:
        data = f.read()
    #data = re.sub(r"(^import(.*)?$\n)*", replace_imports, data, 1, re.M)
    #data = re.sub(r"^(\s+)(topic: topic)\(\"([^\"]*)\", \"([^\"]*)\", \[\n\s*", replace_topic, data, 0, re.M)
    data = re.sub(r"^(.*)(label\()\"(([^\"]*(\\\")?)*[^\\])\"\)", replace_label, data, 0, re.M)
    print(data)
    with open(topic, "w") as f:
        f.write(data)
    #break
    #cnt += 1
    #if cnt == 10:
    #    break