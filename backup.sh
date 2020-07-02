#!/bin/zsh

dry_run=${dry_run:-false}
while getopts d: option
do
    case "${option}"
        in
        d) dry_run=${OPTARG};;
    esac
done

backup() {
    local BACKUP="$MEDIA/BACKUP"
    [ ! -d $BACKUP ] && echo "The directory $MEDIA/BACKUP doesn't exist" && return

    declare -A folders=(
        # $MEDIA/test test-test/test
        $HOME/Documents home/Documents
        $HOME/Nextcloud home/nextcloud
        $MEDIA/assets assets
        $MEDIA/Documentaries documentaries
        $MEDIA/Ebooks ebooks
        $MEDIA/Install install
        $MEDIA/MAO mao
        $MEDIA/Music music
        $MEDIA/Photos photos
        $MEDIA/Video video
    )

    for key val in "${(@kv)folders}"; do
        local src=$key
        local dest="$BACKUP/$val"

        [ ! -d $src ] && echo "The directory $key doesn't exist -- NO BACKUP CREATED" && continue
        mkdir -p $dest

        if [[ "$dry_run" != true ]]; then
            rsync -arvz --delete $src/ $dest
        else
            rsync -arvz --delete --dry-run $src/ $dest
        fi
    done
}

backup
