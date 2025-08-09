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

saveTo() {
    rm $1

    _run native:savefeatures \
        INPUT=origin/temp_i.gpkg \
        OUTPUT=$1

    rm origin/temp_i.gpkg
}

init=\
    INPUT=origin/data.zip \
    OUTPUT=origin/temp_i.gpkg
