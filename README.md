# twitter-utils
Utilities for Twitter API

 1. get-bearer.sh - Obtain a bearer token for Twitter application-only auth

    ```
	Usage :
	 ./get-bearer.sh [-k <consumer_key>] [-s <consumer_secret>] (-h for help)
    ```

 2. get-friends.sh - Obtain a user's friends (upto 5000 only!)

    ```
	Usage:
	 ./get-friends.sh [-a <auth_bearer>] [-s <screen_name>] (-h for help)

	Example:
	 ./get-friends.sh -a foo -s realDonaldTrump | jq .ids[]
    ```

 3. get-tweets.sh - Obtain a user's tweets (upto 200 only!)

    ```
	Usage: 
	 ./get-tweets.sh [-a <auth_bearer>] [-s <screen_name>] [-m <max_id>] (-h for help)
	 
	Example:
	 ./get-tweets.sh -a foo -s realDonaldTrump | jq '.[].text'
         ./get-tweets.sh -a foo -s realDonaldTrump -m 954679973570383872 | jq '.[].text'
    ```
