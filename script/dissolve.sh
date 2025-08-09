source script/run.sh

_run native:extractbyattribute \
    $init \
    FIELD=road_rank \
    VALUE=101

run native:extractbyattribute \
    FIELD=connect \
    VALUE=0

run native:dissolve \
    SEPARATE_DISJOINT=1 \
    FIELD="road_rank;road_no;road_name"

saveTo origin/dissolved.sqlite
