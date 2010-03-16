# Based off http://railscasts.com/episodes/151-rack-middleware
class XBender
  def initialize(app)
    @app = app
  end

  # This makes it threadsafe
  def call(env)
    dup._call(env)
  end

  def _call(env)
    @status, @headers, @response = @app.call(env)
    @headers['X-Bender'] = quote
    [@status, @headers, @response]
  end
  
  def quote
    quotes = [
      "Bite my shiny metal ass!",
      "This is the worst kind of discrimination. The kind against me!",
      "Oh. Your. God.",
      "My life, and by extension everyone else's is meaningless.",
      "I'm Bender, baby, please insert liquor!",
      "They're not very heavy, but you don't hear me not complaning.",
      "Everybody's a jerk. You, me, this jerk.",
      "I hate the people that love me and they hate me.",
      "Do I preach to you while you're lying stoned in the gutter? No.",
      "Tempers are wearing thin. Let's hope some robot doesn't kill everybody.",
      "Bite my shiny metal ass!",
      "I'm gonna go build my own theme park! With blackjack and hookers! In fact, forget the park!",
      "That's no alien spaceship-that's my ass!",
      "Bribe is such an ugly word. I prefer extortion. The X makes it sound cool.",
      "Life can be hilariously cruel.",
      "Leela cracked corn, and i dont care. Fry cracked corn, i still dont care. Bender cracked corn, and he is great! Take that you stupid corn!",
      "Fry, as you know, there are lots of things I'm willing to kill for: jewels, vengeance, Father O'Mallee's weed-whacker. But at long last I've found something I'm willing to die for... This mindless turtle.",
      "Let's face it, comedy's a dead art form. Tragedy, now that's funny.",
      "Great is OK, but amazing would be GREAT.",
      "Congratulations Fry, you've snagged the perfect girlfriend. Amy's rich, she's probably got other characteristics...",
      "Who are you, and why should I care?",
      "What kind of party is this? There's no booze and only one hooker.",
      "I was thinking Benderbrau if it's an ale, Botweiser if it's a lager.",
      "Ahhh, what an awful dream. Ones and zeroes everywhere... and I thought I saw a two.",
      "What do you mean 'we,' flesh-tube?",
      "I guess a robot would have to be crazy to wanna' be a folk-singer..."
    ]
                            
    quotes[rand(quotes.size)]
  end
end