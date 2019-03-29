def dictionary(word)
  dictionary = {
    "hi" => "hello",
    '2' => ["to", "two", "too"],
    '4' => ["for", "four"],
    'b' => "be",
    'u' => "you",
    "@" => "at",
    "&" => "and"
  }

  dictionary.each do |key, value|
      if dictionary[key] === word.downcase
        return key
      elsif dictionary[key].is_a?(Array)
        if dictionary[key].include?(word.downcase)
          return key
        end
      end
    end
   word
 end


def word_substituter(tweet)
  new_tweet = tweet.split.map! do |word|
    dictionary(word)
  end
  new_tweet.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.collect do | tweet |
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length < 140
    return tweet
  else
    word_substituter(tweet)
  end
end

def shortened_tweet_truncator(tweet)
  if tweet.length < 140
    return tweet
  else
    split_tweet = [tweet[0...139], tweet[140..-1]]
    split_tweet[1] = "..."
    split_tweet.join()
  end
end
