# nodelink - 2
전국표준노드링크

## load
```bash
# [2025-05-12]NODELINKDATA.zip
curl -o origin/data.zip https://www.its.go.kr/opendata/nodelinkFileSDownload/DF_203/0
```

## convert
```bash
# C:\Program Files\QGIS 3.40.8\bin\qgis_process-qgis-ltr.bat
qgis_process-qgis-ltr.bat run native:savefeatures --INPUT=origin/data.zip --OUTPUT=origin/data.sqlite
```

## run
```bash
sqlite3 origin/data.sqlite < main.sql
```
