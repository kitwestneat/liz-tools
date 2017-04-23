DATE_SPEC=${1:-yesterday}
BASE_DIR=${2:-/home/liz/Pictures/}
OUTPUT_DIR=${3:-/home/liz/Videos/}
YESTERDAY=$(date -d "$DATE_SPEC" +%F)
UPLOAD_DIR=$BASE_DIR/$YESTERDAY

in_fr=24
out_fr=24

FFMPEG_CMD="ffmpeg -framerate $in_fr -i – -r $out_fr"

ls $UPLOAD_DIR | $FFMPEG_CMD $OUTPUT_DIR/$YESTERDAY.24h.mp4
cat $(cat $YESTERDAY.lst) | $FFMPEG_CMD $OUTPUT_DIR/$YESTERDAY.14h.mp4
