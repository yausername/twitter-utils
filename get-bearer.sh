#/bin/sh

usage() {
    echo "Obtain a bearer token for Twitter application-only auth"
    echo "Usage: $0 [-k <consumer_key>] [-s <consumer_secret>] (-h for help)"; 
}

while getopts ":hk:s:" o; do
    case "$o" in
        h)
            usage
            exit 0
            ;;
        k)
            k=$OPTARG
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

if [ -z "${k}" ] || [ -z "${s}" ]; then
    usage 1>&2;
    exit 1
fi

encoded_cred=$(printf $k:$s | base64 -w 0)

curl -s -X POST -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" -H "Authorization: Basic $encoded_cred" -d "grant_type=client_credentials" https://api.twitter.com/oauth2/token

