#/bin/sh

usage() {
    echo "Obtain a user's friends (upto 5000 only!)"
    echo "Usage: $0 [-a <auth_bearer>] [-s <screen_name>] (-h for help)"; 
}

while getopts ":ha:s:" o; do
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

curl -s -H "Authorization: Bearer $a" "https://api.twitter.com/1.1/friends/ids.json?cursor=-1&screen_name=$s&count=5000"

