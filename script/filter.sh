source script/run.sh

_run native:extractbyattribute \
    $init \
    FIELD=road_rank \
    VALUE=101

saveTo origin/filtered.sqlite
