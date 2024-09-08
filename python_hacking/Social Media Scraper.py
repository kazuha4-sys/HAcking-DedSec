import tweepy

def get_tweets(api_key, api_secret_key, access_token, access_token_secret, username):
    auth = tweepy.OAuthHandler(api_key, api_secret_key)
    auth.set_access_token(access_token, access_token_secret)
    api = tweepy.API(auth)
    
    tweets = api.user_timeline(screen_name=username, count=10)
    for tweet in tweets:
        print(f"{tweet.user.name} said: {tweet.text}")

# Exemplo de uso (é necessário ter chaves de API válidas)
# get_tweets("API_KEY", "API_SECRET", "ACCESS_TOKEN", "ACCESS_SECRET", "username")
