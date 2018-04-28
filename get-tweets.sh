#/bin/sh

usage() {
    echo "Obtain a user's tweets (upto 200 only!)"
    echo "Usage: $0 [-a <auth_bearer>] [-s <screen_name>] [-m <max_id>] (-h for help)";
}

while getopts ":ha:s:m:" o; do
    case "$o" in
        h)
            usage
            exit 0
            ;;
        a)
            a=$OPTARG
            ;;
        s)
            s=$OPTARG
            ;;
        m)
            m=$OPTARG
            ;;
       \?)
            echo "Invalid option: -$OPTARG" 1>&2
            exit 1
            ;;
        *)
            usage 1>&2;
            exit 1;
            ;;
    esac
done

if [ -z "${a}" ] || [ -z "${s}" ]; then
    usage 1>&2;
    exit 1
fi

if [ -z "${m}" ]; then
    curl -s -H "Authorization: Bearer $a" "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=$s&exclude_replies=false&count=200"
else
    curl -s -H "Authorization: Bearer $a" "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=$s&exclude_replies=false&count=200&max_id=$m"
fi

