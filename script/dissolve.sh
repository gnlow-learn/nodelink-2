CYAN="\e[36m"
RESET="\e[0m"

_run() {
    local op=$1
    echo -e "${CYAN}run $1${RESET}"

    shift

    qgis_process-qgis-ltr.bat --no-python run $op -- "$@"
}
run() {
    _run $op "$@" \
        INPUT=origin/temp_i.gpkg \
        OUTPUT=origin/temp_o.gpkg
    mv origin/temp_o.gpkg origin/temp_i.gpkg
}

init= \
    INPUT=origin/data.zip \
    OUTPUT=origin/temp_i.gpkg

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

rm origin/dissolved.sqlite

_run native:savefeatures \
    INPUT=origin/temp_i.gpkg \
    OUTPUT=origin/dissolved.sqlite

rm origin/temp_i.gpkg
