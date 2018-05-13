#TODO: bamboozle picture on hearing 'bamboozle'

class Doggerism
  randomize_list: (list) ->
    element = list[Math.floor(Math.random()*list.length)]
    element

module.exports = (robot) ->
  doggerism = new Doggerism

  dog_actions = [
    "exposes belly for rubs",
    "sniffs the air",
    "looks at you with puppy dog eyes",
    "whines expectantly",
    "wags tail",
    "prepares for snuggling",
    "runs a circle around the table",
    "pops ears up",
    "does a L O N G B O Y E",
    "does a sniff",
    "does a bamboozle",
    "sploots",
    "chases tail",
    "barks incessently for ten minutes",
    "snuggles vigorously",
    "looks for a treat"

  ]

  dog_speech = [
    "Woof!",
    "Bork!"
  ]
  robot.hear /(pupper|doggo|dogger|puppo|pup)/i, (res) ->
    dog_speak = doggerism.randomize_list(dog_speech)
    res.send "#{dog_speak}"

  robot.hear /good boy/i, (res) ->
    dog_action = doggerism.randomize_list(dog_actions)
    room = res.message.room
    adapter = robot.adapterName
    if adapter == "shell"
      res.send "#{dog_action}"
    else
      params = {
        channel: room,
        text: dog_action
      }
      robot.slack.chat.meMessage(params)
