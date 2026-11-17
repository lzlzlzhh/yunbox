#!/usr/bin/env bash
# 更新 jar 后重算 MD5，并可选写入绝对地址
# 用法: ./build.sh [用户名] [仓库名]
set -euo pipefail
cd "$(dirname "$0")"

MD5=$(md5sum custom_spider.jar | cut -d' ' -f1)
echo "jar md5 = $MD5"

for f in tvbox.json; do
  python3 - "$f" "$MD5" <<'PY'
import json,sys
f,md5=sys.argv[1],sys.argv[2]
d=json.load(open(f,encoding="utf-8"))
d["spider"]=f"./custom_spider.jar;md5;{md5}"
json.dump(d,open(f,"w",encoding="utf-8"),ensure_ascii=False,indent=4)
print("已更新",f)
PY
done

if [ $# -ge 2 ]; then
  OWNER="$1"; REPO="$2"
  python3 - "$MD5" "$OWNER" "$REPO" <<'PY'
import json,sys
md5,owner,repo=sys.argv[1:4]
raw=f"https://raw.githubusercontent.com/{owner}/{repo}/main/custom_spider.jar;md5;{md5}"
proxy=f"https://ghproxy.net/https://raw.githubusercontent.com/{owner}/{repo}/main/custom_spider.jar;md5;{md5}"
for name,sp in [("tvbox-absolute.json",raw),("tvbox-proxy.json",proxy)]:
    d=json.load(open(name,encoding="utf-8"))
    d["spider"]=sp
    json.dump(d,open(name,"w",encoding="utf-8"),ensure_ascii=False,indent=4)
    print("已更新",name)
PY
  echo "绝对地址: https://raw.githubusercontent.com/$OWNER/$REPO/main/tvbox.json"
fi
